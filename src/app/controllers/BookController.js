import Book from '../models/Book';
import Illustrator from '../models/Illustrator';

class BookController {
  async list(req, res) {
    try {
      const books = await Book.findAll({
        include: [
          {
            model: Illustrator,
            as: 'illustrators',
            attributes: ['id', 'name'],
            through: { attributes: [] },
          },
        ],
      });

      return res.status(200).json(books);
    } catch (err) {
      return res.status(400).json({ error: 'Error listing book' });
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

      const { id, title, isbn } = book;

      const preparer = {
        id,
        title,
        isbn,
      };

      return res.status(201).json(preparer);
    } catch (err) {
      console.log(err);
      return res.status(400).json({ error: 'Error creating book' });
    }
  }
}

export default new BookController();
