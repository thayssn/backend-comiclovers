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

  async changeFav(req, res) {
    const { favorite, book_id, user_id } = req.body;

    if (!book_id || !user_id) {
      return res.status(404).json({ error: 'Not found' });
    }

    try {
      const review = await Review.findOne({
        where: {
          book_id,
          user_id,
        },
      });

      if (!review) {
        return res.status(404).json({ error: 'Not found' });
      }

      const putReview = await Review.update(
        {
          favorite,
        },
        {
          where: { book_id, user_id },
        }
      );

      return res.status(201).json({
        status: 201,
        req: req.body,
        res: putReview,
      });
    } catch (err) {
      return res.status(500).json('Something went wrong');
    }
  }

  async showAllUserFavorites(req, res) {
    const user_id = req.userId;
    const page = req.query.page || 1;
    const limit = req.query.limit || 20;

    const offset = limit * (page - 1);

    if (!user_id) {
      return res.status(404).json({ error: 'Not found' });
    }

    try {
      const review = await Review.findAll({
        where: {
          user_id,
          favorite: true,
        },
        limit,
        offset,
        order: [['created_at', 'DESC']],
        include: [
          {
            model: Book,
            required: true,
          },
        ],
      });

      if (!review) {
        return res.status(404).json({ error: 'Not found' });
      }

      const totalData = review.length;
      const totalPages = Math.ceil(totalData / limit);

      return res.status(200).json({
        review,
        books: review.map(r => r.Book),
        totalData,
        totalPages,
      });
    } catch (err) {
      return res.status(500).json('Error showing review');
    }
  }
}

export default new ReviewController();
