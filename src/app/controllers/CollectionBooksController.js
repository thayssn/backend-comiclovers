import Collection from '../models/Collection';

class CollectionBooksController {
  async store(req, res) {
    try {
      const collection = await Collection.findOne({
        where: {
          id: req.params.id,
          user_id: req.userId,
        },
      });

      const { books } = req.body;

      if (!collection) {
        return res.status(404).json({
          error: 'Collection not found',
        });
      }

      await collection.setBooks(books);

      return res.status(201).json({
        success: true,
      });
    } catch (err) {
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
      return res.status(400).json({ error: 'Error tring to show collection' });
    }
  }
}

export default new CollectionBooksController();
