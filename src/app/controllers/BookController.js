import sharp from 'sharp';
import fs from 'fs';
import path from 'path';
import Book from '../models/Book';
import Illustrator from '../models/Illustrator';
import Writer from '../models/Writer';
import Publisher from '../models/Publisher';
import Licensor from '../models/Licensor';

const bookAttributes = ['id', 'title', 'isbn', 'thumbnail'];

class BookController {
  async list(req, res) {
    try {
      const books = await Book.findAll({
        attributes: bookAttributes,
      });
      if (!books.length) {
        return res.status(404).json({ error: 'No books found' });
      }
      return res.status(200).json(books);
    } catch (err) {
      return res.status(400).json({ error: 'Error listing book' });
    }
  }

  async show(req, res) {
    const { id } = req.params;
    try {
      const book = await Book.findByPk(id, {
        attributes: [
          'id',
          'title',
          'description',
          'edition',
          'pages',
          'price',
          'thumbnail',
          'format',
          'total_rating',
          'publishing_date',
        ],
        include: [
          {
            model: Illustrator,
            as: 'illustrators',
            attributes: ['name'],
            through: { attributes: [] },
          },
          {
            model: Writer,
            as: 'writers',
            attributes: ['name'],
            through: { attributes: [] },
          },
          {
            model: Publisher,
            as: 'publishers',
            attributes: ['name'],
            through: { attributes: [] },
          },
          {
            model: Licensor,
            as: 'licensors',
            attributes: ['name'],
            through: { attributes: [] },
          },
        ],
      });

      if (!book) {
        return res.status(404).json({ error: 'Book not found' });
      }
      return res.status(200).json(book);
    } catch (err) {
      return res.status(400).json({ error: 'Error trying to find book' });
    }
  }

  async showByISBN(req, res) {
    const { isbn } = req.body;
    try {
      const book = await Book.findOne({
        where: {
          isbn,
        },
        attributes: ['id'],
      });

      if (!book) {
        return res.status(404).json({ error: 'Book not found' });
      }
      return res.status(200).json(book);
    } catch (err) {
      return res.status(400).json({ error: 'Error trying to find book' });
    }
  }

  async store(req, res) {
    const body = JSON.parse(req.body.jsonPayload);

    try {
      const bookExists = await Book.findOne({
        where: { isbn: body.isbn },
      });

      if (bookExists) {
        return res.status(400).json({
          error: `Book already exists`,
        });
      }

      const book = await Book.create(body);

      await book.setIllustrators(body.illustrators);
      await book.setWriters(body.writers);
      await book.setPublishers(body.publishers);
      await book.setLicensors(body.licensors);

      if (req.file) {
        book.thumbnail = `${book.isbn}.png`;

        await sharp(req.file.path)
          .resize(200)
          .jpeg({ quality: 70 })
          .toFile(path.resolve(req.file.destination, book.thumbnail));
        fs.unlinkSync(req.file.path);

        book.save();
      }

      return res.status(201).json({
        success: true,
        book: { id: book.id, title: book.title, isbn: book.isbn },
      });
    } catch (err) {
      console.log(err);
      return res.status(400).json({ error: 'Error creating book' });
    }
  }

  async update(req, res) {
    const { id } = req.params;
    const { body } = req;
    try {
      const book = await Book.findByPk(id);

      if (!book) {
        res.status(404).json({ error: 'Book not found' });
      }

      if (body.isbn) {
        const bookExists = await Book.findOne({
          where: { isbn: body.isbn },
        });

        if (bookExists) {
          return res.status(400).json({
            error: `book already exists`,
          });
        }
      }

      await book.update(body);

      await book.setIllustrators(body.illustrators);
      await book.setWriters(body.writers);
      await book.setLicensors(body.licensors);
      await book.setPublishers(body.publishers);

      if (req.file) {
        book.thumbnail = `${book.isbn}.png`;

        await sharp(req.file.path)
          .resize(200)
          .jpeg({ quality: 70 })
          .toFile(path.resolve(req.file.destination, book.thumbnail));
        fs.unlinkSync(req.file.path);
      }

      return res.status(200).json(book);
    } catch (err) {
      console.log(err);
      return res.status(400).json({ error: 'Error updating book' });
    }
  }

  async remove(req, res) {
    const { id } = req.params;
    try {
      await Book.destroy({ where: { id } });
      return res.status(200).json({ success: 'Book deleted' });
    } catch (err) {
      console.log(err);
      return res.status(400).json({ error: 'An error occurred' });
    }
  }
}

export default new BookController();
