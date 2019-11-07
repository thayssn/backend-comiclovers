import Colorist from '../models/Colorist';

class ColoristController {
  async list(req, res) {
    try {
      const currentPage = req.query.page;
      const currentLimit = req.query.limit;
      const limit = parseInt(currentLimit, 0) || 100;
      const offset = limit * (parseInt(currentPage, 0) || 0);
      const colorists = await Colorist.findAll({
        offset,
        limit,
      });
      return res.status(200).json(colorists);
    } catch (err) {
      return res.status(400).json({ error: 'Error listing colorist' });
    }
  }

  async show(req, res) {
    const { id } = req.params;
    try {
      const colorist = await Colorist.findByPk(id);
      if (!colorist) {
        res.status(404).json({ error: 'colorist not found' });
      }
      return res.status(200).json(colorist);
    } catch (err) {
      return res.status(400).json({ error: 'Error showing colorist details' });
    }
  }

  async store(req, res) {
    try {
      const coloristExists = await Colorist.findOne({
        where: { name: req.body.name },
      });

      if (coloristExists) {
        return res.status(400).json({
          error: `colorist already exists`,
        });
      }

      const colorist = await Colorist.create(req.body);

      return res.status(201).json(colorist);
    } catch (err) {
      return res.status(400).json({ error: 'Error creating colorist' });
    }
  }

  async update(req, res) {
    const { id } = req.params;
    try {
      const colorist = await Colorist.findByPk(id);

      if (!colorist) {
        res.status(404).json({ error: 'Colorist not found' });
      }

      const coloristExists = await Colorist.findOne({
        where: { name: req.body.name },
      });

      if (coloristExists) {
        return res.status(400).json({
          error: `Colorist already exists`,
        });
      }

      await colorist.update(req.body);

      return res.status(200).json(colorist);
    } catch (err) {
      return res.status(400).json({ error: 'Error updating colorist' });
    }
  }

  async remove(req, res) {
    const { id } = req.params;
    try {
      await Colorist.destroy({ where: { id } });
      return res.status(200).json({ success: 'Colorist deleted' });
    } catch (err) {
      return res.status(400).json({ error: 'An error occurred' });
    }
  }
}

export default new ColoristController();
