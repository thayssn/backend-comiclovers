import Licensor from '../models/Licensor';

class LicensorController {
  async list(req, res) {
    try {
      const licensors = await Licensor.findAll();
      return res.status(200).json(licensors);
    } catch (err) {
      return res.status(400).json({ error: 'Error listing licensors' });
    }
  }

  async show(req, res) {
    const { id } = req.params;
    try {
      const licensor = await Licensor.findByPk(id);
      if (!licensor) {
        res.status(404).json({ error: 'Licensor not found' });
      }
      return res.status(200).json(licensor);
    } catch (err) {
      return res.status(400).json({ error: 'Error showing licensor details' });
    }
  }

  async store(req, res) {
    try {
      const licensorExists = await Licensor.findOne({
        where: { name: req.body.name },
      });

      if (licensorExists) {
        return res.status(400).json({
          error: `Licensor already exists`,
        });
      }

      const licensor = await Licensor.create(req.body);
      return res.status(201).json(licensor);
    } catch (err) {
      return res.status(400).json({ error: 'Error creating licensor' });
    }
  }

  async update(req, res) {
    const { id } = req.params;
    try {
      const licensor = await Licensor.findByPk(id);

      if (!licensor) {
        res.status(404).json({ error: 'Licensor not found' });
      }

      const licensorExists = await Licensor.findOne({
        where: { name: req.body.name },
      });

      if (licensorExists) {
        return res.status(400).json({
          error: `Licensor already exists`,
        });
      }

      await Licensor.update(req.body);

      return res.status(200).json(licensor);
    } catch (err) {
      return res.status(400).json({ error: 'Error updating licensor' });
    }
  }

  async remove(req, res) {
    const { id } = req.params;
    try {
      await Licensor.destroy({ where: { id } });
      return res.status(200).json({ success: 'Licensor deleted' });
    } catch (err) {
      return res.status(400).json({ error: 'An error occurred' });
    }
  }
}

export default new LicensorController();
