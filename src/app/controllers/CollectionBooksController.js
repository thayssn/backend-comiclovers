import Collection from '../models/Collection';
import Book from '../models/Book';

class CollectionBooksController {
  async store(req, res) {
    try {
      const collection = await Collection.findOne({
        where: {
          id: req.params.id,
          user_id: req.userId,
        },
      });

      if (!collection) {
        return res.status(404).json({
          error: 'Collection not found',
        });
      }

      const book = await Book.findByPk(req.body.id, {
        attributes: ['id', 'title'],
      });

      if (!book) {
        return res.status(404).json({
          error: 'Book not found',
        });
      }

      await collection.addBook(book);

      return res.status(201).json({
        book,
      });
    } catch (err) {
      console.log(err);
      return res.status(400).json({ error: 'Error add book to collection' });
    }
  }

  async remove(req, res) {
    try {
      const collection = await Collection.findOne({
        where: {
          id: req.params.id,
          user_id: req.userId,
        },
      });

      if (!collection) {
        return res.status(404).json({
          error: 'Collection not found',
        });
      }

      await collection.removeBook(req.body.id);

      return res.status(200).json({
        success: true,
        message: 'Book removed successfully',
      });
    } catch (err) {
      console.log(err);
      return res.status(400).json({ error: 'Error tring to show collection' });
    }
  }
}

export default new CollectionBooksController();
