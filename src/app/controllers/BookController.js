import Book from '../models/Book';
import Illustrator from '../models/Illustrator';
import Writer from '../models/Writer';
import Publisher from '../models/Publisher';
import Licensor from '../models/Licensor';

const bookAttributes = ['id', 'title', 'isbn'];

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
        attributes: bookAttributes,
        include: [
          {
            model: Illustrator,
            as: 'illustrators',
            attributes: ['id', 'name'],
            through: { attributes: [] },
          },
          {
            model: Writer,
            as: 'writers',
            attributes: ['id', 'name'],
            through: { attributes: [] },
          },
          {
            model: Publisher,
            as: 'publishers',
            attributes: ['id', 'name'],
            through: { attributes: [] },
          },
          {
            model: Licensor,
            as: 'licensors',
            attributes: ['id', 'name'],
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

  async store(req, res) {
    try {
      const bookExists = await Book.findOne({
        where: { isbn: req.body.isbn },
      });

      if (bookExists) {
        return res.status(400).json({
          error: `Book already exists`,
        });
      }

      const book = await Book.create(req.body);

      await book.addIllustrator(req.body.illustrators);
      await book.addWriter(req.body.writers);
      await book.addPublisher(req.body.publishers);
      await book.addLicensor(req.body.licensors);

      return res.status(201).json({ success: true });
    } catch (err) {
      console.log(err);
      return res.status(400).json({ error: 'Error creating book' });
    }
  }

  async update(req, res) {
    const { id } = req.params;
    try {
      const book = await Book.findByPk(id);

      if (!book) {
        res.status(404).json({ error: 'Book not found' });
      }

      const bookExists = await Book.findOne({
        where: { isbn: req.body.isbn },
      });

      if (bookExists) {
        return res.status(400).json({
          error: `book already exists`,
        });
      }

      await book.update(req.body);

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
      return res.status(400).json({ error: 'An error occurred' });
    }
  }
}

export default new BookController();
