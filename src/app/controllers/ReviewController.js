import Review from '../models/Review';
import Book from '../models/Book';

class ReviewController {
  async store(req, res) {
    const { rating, comment, favorite, has_book } = req.body;
    console.log(rating);
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
          rating: rating || 0,
          comment: comment || null,
          favorite: favorite || false,
          has_book: has_book || false,
        },
      });

      await review.setBook(book);
      await review.setUser(req.userId);
      let incrementRating = rating || 0;

      if (!wasCreated) {
        if (rating) {
          incrementRating = rating - review.rating;
        }
        console.log('incrementRating', incrementRating);
        await review.update(req.body);
      }

      await book.increment('total_rating', { by: incrementRating });

      return res.status(201).json(review);
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
        attributes: ['rating', 'comment', 'favorite', 'has_book'],
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
