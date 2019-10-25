import Writer from '../models/Writer';

class WriterController {
  async list(req, res) {
    try {
      const currentPage = req.query.page;
      const currentLimit = req.query.limit;
      const limit = parseInt(currentLimit, 0) || 100;
      const offset = limit * (parseInt(currentPage, 0) || 0);
      const writers = await Writer.findAll({
        limit,
        offset,
      });
      return res.status(200).json(writers);
    } catch (err) {
      return res.status(400).json({ error: 'Error listing writers' });
    }
  }

  async show(req, res) {
    const { id } = req.params;
    try {
      const writer = await Writer.findByPk(id);
      if (!writer) {
        res.status(404).json({ error: 'Writer not found' });
      }
      return res.status(200).json(writer);
    } catch (err) {
      return res.status(400).json({ error: 'Error showing writer details' });
    }
  }

  async store(req, res) {
    try {
      const writerExists = await Writer.findOne({
        where: { name: req.body.name },
      });

      if (writerExists) {
        return res.status(400).json({
          error: `Writer already exists`,
        });
      }

      const writer = await Writer.create(req.body);
      return res.status(201).json(writer);
    } catch (err) {
      return res.status(400).json({ error: 'Error creating writer' });
    }
  }

  async update(req, res) {
    const { id } = req.params;
    try {
      const writer = await Writer.findByPk(id);

      if (!writer) {
        res.status(404).json({ error: 'Writer not found' });
      }

      const writerExists = await Writer.findOne({
        where: { name: req.body.name },
      });

      if (writerExists) {
        return res.status(400).json({
          error: `Writer already exists`,
        });
      }

      await Writer.update(req.body);

      return res.status(200).json(writer);
    } catch (err) {
      return res.status(400).json({ error: 'Error updating writer' });
    }
  }

  async remove(req, res) {
    const { id } = req.params;
    try {
      await Writer.destroy({ where: { id } });
      return res.status(200).json({ success: 'Writer deleted' });
    } catch (err) {
      return res.status(400).json({ error: 'An error occurred' });
    }
  }
}

export default new WriterController();
