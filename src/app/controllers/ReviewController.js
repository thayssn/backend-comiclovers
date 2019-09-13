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
      let incrementRating = rating;

      if (!wasCreated) {
        incrementRating = rating - review.rating;
        await review.update({
          rating,
        });
      }

      await book.increment('total_rating', { by: incrementRating });

      return res.status(201).json({
        review,
      });
    } catch (err) {
      return res.status(400).json({ error: 'Error creating review' });
    }
  }

  async show(req, res) {
    const book_id = parseInt(req.params.id, 0);
    try {
      const review = await Review.findOne({
        where: {
          book_id,
          user_id: req.userId,
        },
        attributes: ['rating'],
      });

      if (!review) {
        return res.status(404).json({ error: 'Review not found' });
      }

      return res.status(200).json(review);
    } catch (err) {
      console.log(err);
      return res.status(400).json('Error showing review');
    }
  }
}

export default new ReviewController();
