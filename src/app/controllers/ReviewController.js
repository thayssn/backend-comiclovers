import Review from '../models/Review';
import Book from '../models/Book';

class ReviewController {
  async store(req, res) {
    const { rating } = req.body;
    const book_id = parseInt(req.params.id, 0);
    try {
      const book = await Book.findByPk(book_id);

      if (!book) {
        return res.status(404).json({ error: 'Book not found' });
      }

      console.log(req.userId);

      const [review, wasCreated] = await Review.findOrCreate({
        where: {
          book_id: book.id,
          user_id: req.userId,
        },
        defaults: {
          rating,
        },
      });

      await review.setBook(book);
      await review.setUser(req.userId);

      if (!wasCreated) {
        await review.update({
          rating,
        });
      }

      return res.status(201).json({
        review,
      });
    } catch (err) {
      console.log(err);
      return res.status(400).json({ error: 'Error creating review' });
    }
  }
}

export default new ReviewController();
