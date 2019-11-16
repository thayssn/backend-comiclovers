import sharp from 'sharp';
import fs from 'fs';
import path from 'path';
import Sequelize from 'sequelize';
import Book from '../models/Book';
import Illustrator from '../models/Illustrator';
import Colorist from '../models/Colorist';
import Writer from '../models/Writer';
import Publisher from '../models/Publisher';
import Licensor from '../models/Licensor';
import Review from '../models/Review';

const { Op } = Sequelize;

class BookController {
  async list(req, res) {
    try {
      const currentPage = req.query.page;
      const currentLimit = req.query.limit;
      const limit = parseInt(currentLimit, 0) || null;
      const offset = limit * (parseInt(currentPage, 0) || 0);
      const booksCount = await Book.count();
      const books = await Book.findAll({
        limit,
        offset,
        order: [['updated_at', 'DESC']],
        attributes: [
          'id',
          'isbn',
          'isbn_10',
          'title',
          'description',
          'edition',
          'pages',
          'price',
          'thumbnail',
          'format',
          'total_rating',
          'publishing_date',
          'updated_at',
        ],
        include: [
          {
            model: Illustrator,
            as: 'illustrators',
            attributes: ['name', 'id'],
            through: { attributes: [] },
          },
          {
            model: Colorist,
            as: 'colorists',
            attributes: ['name', 'id'],
            through: { attributes: [] },
          },
          {
            model: Writer,
            as: 'writers',
            attributes: ['name', 'id'],
            through: { attributes: [] },
          },
          {
            model: Publisher,
            as: 'publishers',
            attributes: ['name', 'id'],
            through: { attributes: [] },
          },
          {
            model: Licensor,
            as: 'licensors',
            attributes: ['name', 'id'],
            through: { attributes: [] },
          },
        ],
      });

      if (!books.length) {
        return res.status(404).json({ error: 'No books found' });
      }
      return res.status(200).json({ books, total: booksCount });
    } catch (err) {
      return res.status(400).json({ error: 'Error listing books' });
    }
  }

  async show(req, res) {
    const { id } = req.params;
    try {
      const book = await Book.findByPk(id, {
        attributes: [
          'id',
          'isbn',
          'isbn_10',
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
            attributes: ['name', 'id'],
            through: { attributes: [] },
          },
          {
            model: Colorist,
            as: 'colorists',
            attributes: ['name', 'id'],
            through: { attributes: [] },
          },
          {
            model: Writer,
            as: 'writers',
            attributes: ['name', 'id'],
            through: { attributes: [] },
          },
          {
            model: Publisher,
            as: 'publishers',
            attributes: ['name', 'id'],
            through: { attributes: [] },
          },
          {
            model: Licensor,
            as: 'licensors',
            attributes: ['name', 'id'],
            through: { attributes: [] },
          },
          {
            model: Review,
            as: 'reviews',
            attributes: ['rating', 'id', 'UserId'],
          },
        ],
      });

      if (!book) {
        return res.status(404).json({ error: 'Book not found' });
      }

      return res.status(200).json(book);
    } catch (err) {
      console.log('error', err);
      return res.status(400).json({ error: 'Error trying to find book' });
    }
  }

  async findByISBN(req, res) {
    const { isbn } = req.params;
    try {
      const book = await Book.findOne({
        where: {
          [Op.or]: [{ isbn }, { isbn_10: isbn }],
        },
        attributes: ['id', 'title'],
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
      const book = await Book.create(body);

      await book.setIllustrators(body.illustrators);
      await book.setColorists(body.colorists);
      await book.setWriters(body.writers);
      await book.setPublishers(body.publishers);
      await book.setLicensors(body.licensors);

      if (req.file) {
        book.thumbnail = `static/covers/${book.id}.png`;

        await sharp(req.file.path)
          .resize(200)
          .jpeg({ quality: 70 })
          .toFile(path.resolve(req.file.destination, `${book.id}.png`));
        fs.unlinkSync(req.file.path);

        book.save();
      }

      return res.status(201).json({
        success: true,
        book: { id: book.id, title: book.title, isbn: book.isbn },
      });
    } catch (err) {
      return res.status(400).json({ error: 'Error creating book' });
    }
  }

  async update(req, res) {
    const { id } = req.params;

    try {
      const body = JSON.parse(req.body.jsonPayload);
      const book = await Book.findByPk(id);
      if (!book) {
        return res.status(404).json({ error: 'Book not found' });
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
      await book.setColorists(body.colorists);
      await book.setWriters(body.writers);
      await book.setLicensors(body.licensors);
      await book.setPublishers(body.publishers);

      if (req.file) {
        book.thumbnail = `static/covers/${book.id}.png`;

        await sharp(req.file.path)
          .resize(200)
          .jpeg({ quality: 70 })
          .toFile(path.resolve(req.file.destination, `${book.id}.png`));
        fs.unlinkSync(req.file.path);

        book.save();
      }

      return res.status(200).json(book);
    } catch (err) {
      return res.status(400).json({ error: 'Error updating book' });
    }
  }

  async batchUpdateCover(req, res) {
    try {
      const books = await Book.findAll();
      if (!books) {
        return res.status(404).json({ error: 'No books found' });
      }

      const booksPromises = books.map(async book => {
        book.thumbnail = `static/covers/${book.id}.png`;
        if (fs.existsSync(`./media/book_covers/${book.isbn}.png`)) {
          console.log('exists');
          fs.renameSync(
            `./media/book_covers/${book.isbn}.png`,
            `./media/book_covers/${book.id}.png`,
            err => {
              if (err) console.log(`ERROR: ${err}`);
            }
          );
        } else if (fs.existsSync(`./media/book_covers/${book.isbn}.jpg`)) {
          console.log('jpg exists');

          await sharp(path.resolve('media', 'book_covers', `${book.isbn}.jpg`))
            .resize(200)
            .jpeg({ quality: 70 })
            .toFile(path.resolve('media', 'book_covers', `${book.id}.png`));

          await fs.unlinkSync(`./media/book_covers/${book.isbn}.jpg`);
        }

        if (!fs.existsSync(`./media/book_covers/${book.id}.png`)) {
          console.log('null thumb', book.id);
          book.thumbnail = null;
        }
        return book.save();
      });

      await Promise.all(booksPromises);

      return res.status(200).json({ success: true });
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
      return res.status(400).json({ error: 'An error occurred' });
    }
  }
}

export default new BookController();
