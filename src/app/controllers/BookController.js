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
import Collection from '../models/Collection';

const { Op } = Sequelize;

class BookController {
  async list(req, res) {
    try {
      const currentPage = req.query.page;
      const currentLimit = req.query.limit;
      const whereParams = req.query.whereParams || '{}';
      const limit = parseInt(currentLimit, 0) || null;
      const offset = limit * (parseInt(currentPage, 0) || 0);

      const books = await Book.findAll({
        where: JSON.parse(whereParams),
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
          'status',
          'type',
        ],
        // include: [
        //   {
        //     model: Illustrator,
        //     as: 'illustrators',
        //     attributes: ['name', 'id'],
        //     through: { attributes: [] },
        //   },
        //   {
        //     model: Colorist,
        //     as: 'colorists',
        //     attributes: ['name', 'id'],
        //     through: { attributes: [] },
        //   },
        //   {
        //     model: Writer,
        //     as: 'writers',
        //     attributes: ['name', 'id'],
        //     through: { attributes: [] },
        //   },
        //   {
        //     model: Publisher,
        //     as: 'publishers',
        //     attributes: ['name', 'id'],
        //     through: { attributes: [] },
        //   },
        //   {
        //     model: Licensor,
        //     as: 'licensors',
        //     attributes: ['name', 'id'],
        //     through: { attributes: [] },
        //   },
        // ],
      });

      return res.status(200).json({ books, total: books.length });
    } catch (err) {
      console.log(err);
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
          'status',
          'type',
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
          {
            model: Collection,
            as: 'collections',
            attributes: ['id'],
            through: { attributes: [] },
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
        attributes: ['id', 'title', 'status', 'type'],
      });

      if (!book) {
        return res.status(404).json({ error: 'Book not found' });
      }
      return res.status(200).json(book);
    } catch (err) {
      return res
        .status(400)
        .json({ error: 'Error trying to find book by isbn' });
    }
  }

  async findByTerm(req, res) {
    try {
      const { searchTerm } = req.query;
      const currentPage = parseInt(req.query.page, 0);
      const currentLimit = req.query.limit;
      const limit = parseInt(currentLimit, 0) || 30;
      const offset = limit * (currentPage || 0);
      const books = await Book.findAll({
        where: {
          [Op.or]: [{ title: { [Op.iLike]: `%${searchTerm}%` } }],
        },
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
          'status',
          'type',
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

      return res.status(200).json({
        books,
        total: books.length,
        pages: Math.round(books.length / limit),
        currentPage: currentPage || 0,
      });
    } catch (err) {
      return res.status(400).json({ error: 'Error finding books by terms' });
    }
  }

  async store(req, res) {
    const body = JSON.parse(req.body.jsonPayload);

    console.log(body.type);

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

      if (req.userId) {
        await book.setUser(req.userId);
      }

      return res.status(201).json({
        success: true,
        book: {
          id: book.id,
          title: book.title,
          isbn: book.isbn,
          type: book.type,
        },
      });
    } catch (err) {
      return res.status(400).json({ error: 'Error creating book' });
    }
  }

  async userBookList(req, res) {
    try {
      const books = await Book.findAll({
        where: {
          user_id: req.userId,
        },
        attributes: ['id', 'title', 'status', 'type', 'thumbnail'],
      });

      if (!books.length) {
        return res.status(404).json({ error: 'No books found' });
      }
      return res.status(200).json(books);
    } catch (err) {
      console.log(err);
      return res
        .status(400)
        .json({ error: 'Error trying to find books for this user' });
    }
  }

  async updateStatus(req, res) {
    const { id } = req.params;
    try {
      const { status } = req.body;
      const book = await Book.findByPk(id);

      if (!book) {
        return res.status(404).json({ error: 'Book not found' });
      }

      await book.update({ status });

      return res.status(200).json(book);
    } catch (err) {
      console.log(err);
      return res.status(400).json({ error: 'Error updating book status' });
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
