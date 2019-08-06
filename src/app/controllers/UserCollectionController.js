import sharp from 'sharp';
import fs from 'fs';
import path from 'path';
import Collection from '../models/Collection';
import User from '../models/User';
import Book from '../models/Book';

class UserCollectionController {
  async store(req, res) {
    try {
      const body = JSON.parse(req.body.jsonPayload);
      const user = await User.findByPk(req.userId, {
        attributes: ['id', 'name'],
        include: [
          {
            model: Collection,
            as: 'collections',
            attributes: ['id', 'title'],
          },
        ],
      });
      const collection = await Collection.create({
        ...body,
        user_id: req.userId,
      });

      if (req.file) {
        collection.thumbnail = `${collection.id}.png`;

        await sharp(req.file.path)
          .resize(200)
          .jpeg({ quality: 70 })
          .toFile(path.resolve(req.file.destination, collection.thumbnail));
        fs.unlinkSync(req.file.path);

        collection.save();
      }

      await user.addCollection(collection);

      return res.status(201).json({
        collection,
      });
    } catch (err) {
      console.log(err);
      return res.status(400).json({ error: 'Error creating collection' });
    }
  }

  async list(req, res) {
    try {
      const user = await User.findByPk(req.userId);

      const userCollections = await user.getCollections({
        attributes: ['id', 'title', 'thumbnail'],
      });

      return res.status(200).json(userCollections);
    } catch (err) {
      console.log(err);
      return res.status(400).json({ error: 'Error tring to list collections' });
    }
  }

  async show(req, res) {
    try {
      const user = await User.findByPk(req.userId);

      const collection = await Collection.findOne({
        where: {
          id: req.params.id,
          user_id: user.id,
        },
        attributes: ['id', 'title', 'thumbnail'],
        include: {
          model: Book,
          as: 'books',
          attributes: ['id', 'title', 'thumbnail'],
          through: {
            attributes: [],
          },
        },
      });

      if (!collection) {
        return res.status(404).json({ error: 'Collection not found' });
      }

      return res.status(200).json(collection);
    } catch (err) {
      console.log(err);
      return res.status(400).json({ error: 'Error tring to show collection' });
    }
  }

  async update(req, res) {
    try {
      const user = await User.findByPk(req.userId);

      const collection = await Collection.findOne({
        where: {
          id: req.params.id,
          user_id: user.id,
        },
      });

      collection.update(req.body);

      return res.status(200).json(collection);
    } catch (err) {
      console.log(err);
      return res
        .status(400)
        .json({ error: 'Error tring to update collection' });
    }
  }

  async remove(req, res) {
    try {
      const user = await User.findByPk(req.userId);

      user.removeCollection(req.params.id);

      return res.status(200).json({ success: true });
    } catch (err) {
      console.log(err);
      return res.status(400).json({ error: 'Error tring to show collection' });
    }
  }
}

export default new UserCollectionController();
