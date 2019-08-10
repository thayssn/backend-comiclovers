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

      review.setBook(book);
      review.setUser(req.userId);

      if (!wasCreated) {
        review.update({
          rating,
        });
      }

      const reviews = await book.getReviews();

      book.total_rating = reviews.reduce((f, n) => {
        return f + n.rating;
      }, 0);

      const total = book.total_rating / reviews.length;
      book.save();

      return res.status(201).json({
        total,
      });
    } catch (err) {
      console.log(err);
      return res.status(400).json({ error: 'Error creating review' });
    }
  }

  async update(req, res) {
    const { rating } = req.body;
    try {
      const review = await Review.findOne({
        where: {
          book_id: req.params.id,
          user_id: req.userId,
        },
      });

      if (!review) {
        return res.status(404).json({
          error: 'Review not found',
        });
      }

      await review.update({ rating });

      return res.status(200).json({
        success: true,
        review,
      });
    } catch (err) {
      console.log(err);
      return res.status(400).json({ error: 'Error tring to update review' });
    }
  }
}

export default new ReviewController();
