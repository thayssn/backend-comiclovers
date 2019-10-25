import sharp from 'sharp';
import fs from 'fs';
import path from 'path';
import Collection from '../models/Collection';
import User from '../models/User';
import Book from '../models/Book';

class UserCollectionController {
  async store(req, res) {
    try {
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
        ...req.body,
        user_id: req.userId,
      });

      if (req.file) {
        collection.thumbnail = `static/collections/${collection.id}.png`;

        await sharp(req.file.path)
          .resize(200)
          .jpeg({ quality: 70 })
          .toFile(path.resolve(req.file.destination, `${collection.id}.png`));
        fs.unlinkSync(req.file.path);

        await collection.save();
      }

      await user.addCollection(collection);

      return res.status(201).json({
        collection,
      });
    } catch (err) {
      return res.status(400).json({ error: 'Error creating collection' });
    }
  }

  async list(req, res) {
    try {
      const user = await User.findByPk(req.userId);

      const userCollections = await user.getCollections({
        order: [['title', 'ASC']],
        attributes: ['id', 'title', 'thumbnail', 'type', 'updated_at'],
      });

      return res.status(200).json(userCollections);
    } catch (err) {
      return res.status(400).json({ error: 'Error tring to list collections' });
    }
  }

  async show(req, res) {
    try {
      const collection = await Collection.findOne({
        where: {
          id: req.params.id,
          user_id: req.userId,
        },
        attributes: ['id', 'title', 'thumbnail', 'description'],
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
      return res.status(400).json({ error: 'Error tring to show collection' });
    }
  }

  async update(req, res) {
    try {
      const collection = await Collection.findOne({
        where: {
          id: req.params.id,
          user_id: req.userId,
        },
      });

      await collection.update(req.body);

      if (req.file) {
        collection.thumbnail = `static/collections/${collection.id}.png`;

        await sharp(req.file.path)
          .resize(200)
          .jpeg({ quality: 70 })
          .toFile(path.resolve(req.file.destination, `${collection.id}.png`));
        fs.unlinkSync(req.file.path);

        await collection.save();
      }

      return res.status(200).json(collection);
    } catch (err) {
      return res
        .status(400)
        .json({ error: 'Error tring to update collection' });
    }
  }

  async remove(req, res) {
    try {
      await Collection.destroy({
        where: {
          id: req.params.id,
          user_id: req.userId,
        },
      });

      return res.status(200).json({ success: true });
    } catch (err) {
      return res
        .status(400)
        .json({ error: 'Error tring to remove collection' });
    }
  }

  async listPublic(req, res) {
    try {
      const collections = await Collection.findAll({
        where: {
          type: 'public',
        },
        attributes: ['id', 'title', 'thumbnail', 'description'],
        include: [
          {
            model: Book,
            as: 'books',
            attributes: ['id', 'title', 'thumbnail'],
          },
        ],
      });
      return res.status(200).json(collections);
    } catch (err) {
      return res
        .status(400)
        .json({ error: 'Error tring to list public collections' });
    }
  }

  async showPublic(req, res) {
    try {
      const collection = await Collection.findOne({
        where: {
          id: req.params.id,
          type: 'public',
        },
        attributes: ['id', 'title', 'thumbnail', 'description'],
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
      return res
        .status(400)
        .json({ error: 'Error tring to show public collection' });
    }
  }

  async updatePublic(req, res) {
    try {
      const collection = await Collection.findOne({
        where: {
          id: req.params.id,
          type: 'public',
        },
      });

      await collection.update(req.body);

      if (req.file) {
        collection.thumbnail = `static/collections/${collection.id}.png`;

        await sharp(req.file.path)
          .resize(200)
          .jpeg({ quality: 70 })
          .toFile(path.resolve(req.file.destination, `${collection.id}.png`));
        fs.unlinkSync(req.file.path);

        await collection.save();
      }

      return res.status(200).json(collection);
    } catch (err) {
      return res
        .status(400)
        .json({ error: 'Error tring to update public collection' });
    }
  }

  async removePublic(req, res) {
    try {
      await Collection.destroy({
        where: {
          id: req.params.id,
          type: 'public',
        },
      });

      return res.status(200).json({ success: true });
    } catch (err) {
      console.log(err);
      return res
        .status(400)
        .json({ error: 'Error tring to remove public collection' });
    }
  }
}

export default new UserCollectionController();
