import Publisher from '../models/Publisher';

class PublisherController {
  async list(req, res) {
    try {
      const currentPage = req.query.page;
      const currentLimit = req.query.limit;
      const limit = parseInt(currentLimit, 0) || 20;
      const offset = limit * (parseInt(currentPage, 0) || 0);
      const publishers = await Publisher.findAll({
        offset,
        limit,
      });
      return res.status(200).json(publishers);
    } catch (err) {
      return res.status(400).json({ error: 'Error listing publishers' });
    }
  }

  async show(req, res) {
    const { id } = req.params;
    try {
      const publisher = await Publisher.findByPk(id);
      if (!publisher) {
        res.status(404).json({ error: 'Publisher not found' });
      }
      return res.status(200).json(publisher);
    } catch (err) {
      return res.status(400).json({ error: 'Error showing publisher details' });
    }
  }

  async store(req, res) {
    try {
      const publisherExists = await Publisher.findOne({
        where: { name: req.body.name },
      });

      if (publisherExists) {
        return res.status(400).json({
          error: `publisher already exists`,
        });
      }

      const publisher = await Publisher.create(req.body);
      return res.status(201).json(publisher);
    } catch (err) {
      return res.status(400).json({ error: 'Error creating publisher' });
    }
  }

  async update(req, res) {
    const { id } = req.params;
    try {
      const publisher = await Publisher.findByPk(id);

      if (!publisher) {
        res.status(404).json({ error: 'Publisher not found' });
      }

      const publisherExists = await Publisher.findOne({
        where: { name: req.body.name },
      });

      if (publisherExists) {
        return res.status(400).json({
          error: `publisher already exists`,
        });
      }

      await Publisher.update(req.body);

      return res.status(200).json(publisher);
    } catch (err) {
      return res.status(400).json({ error: 'Error updating publisher' });
    }
  }

  async remove(req, res) {
    const { id } = req.params;
    try {
      await Publisher.destroy({ where: { id } });
      return res.status(200).json({ success: 'Publisher deleted' });
    } catch (err) {
      return res.status(400).json({ error: 'An error occurred' });
    }
  }
}

export default new PublisherController();
