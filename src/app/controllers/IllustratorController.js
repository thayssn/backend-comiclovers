import Illustrator from '../models/Illustrator';

class IllustratorController {
  async list(req, res) {
    try {
      const illustrators = await Illustrator.findAll();
      return res.status(200).json(illustrators);
    } catch (err) {
      return res.status(400).json({ error: 'Error listing illustrator' });
    }
  }

  async show(req, res) {
    const { id } = req.params;
    try {
      const illustrator = await Illustrator.findByPk(id);
      if (!illustrator) {
        res.status(404).json({ error: 'Illustrator not found' });
      }
      return res.status(200).json(illustrator);
    } catch (err) {
      return res
        .status(400)
        .json({ error: 'Error showing illustrator details' });
    }
  }

  async store(req, res) {
    try {
      const illustratorExists = await Illustrator.findOne({
        where: { name: req.body.name },
      });

      if (illustratorExists) {
        return res.status(400).json({
          error: `Illustrator already exists`,
        });
      }

      const illustrator = await Illustrator.create(req.body);

      return res.status(201).json(illustrator);
    } catch (err) {
      return res.status(400).json({ error: 'Error creating illustrator' });
    }
  }

  async update(req, res) {
    const { id } = req.params;
    try {
      const illustrator = await Illustrator.findByPk(id);

      if (!illustrator) {
        res.status(404).json({ error: 'Illustrator not found' });
      }

      const illustratorExists = await Illustrator.findOne({
        where: { name: req.body.name },
      });

      if (illustratorExists) {
        return res.status(400).json({
          error: `Illustrator already exists`,
        });
      }

      await illustrator.update(req.body);

      return res.status(200).json(illustrator);
    } catch (err) {
      return res.status(400).json({ error: 'Error updating illustrator' });
    }
  }

  async remove(req, res) {
    const { id } = req.params;
    try {
      await Illustrator.destroy({ where: { id } });
      return res.status(200).json({ success: 'Illustrator deleted' });
    } catch (err) {
      return res.status(400).json({ error: 'An error occurred' });
    }
  }
}

export default new IllustratorController();
