import { Router, Request, Response } from 'express';
import prisma from '../prisma';

const router = Router();

// GET /clients - list clients (basic pagination optional later)
router.get('/', async (_req: Request, res: Response) => {
  try {
    const clients = await prisma.clients.findMany({
      take: 100,
      orderBy: { IDCLIENTS: 'desc' },
    });
    res.json(clients);
  } catch (error) {
    res.status(500).json({ error: 'Failed to list clients' });
  }
});

// GET /clients/:id - get single client by ID
router.get('/:id', async (req: Request, res: Response) => {
  try {
    const idParam = req.params.id;
    const id = BigInt(idParam);
    const client = await prisma.clients.findUnique({ where: { IDCLIENTS: id } });
    if (!client) {
      return res.status(404).json({ error: 'Client not found' });
    }
    res.json(client);
  } catch (error) {
    res.status(400).json({ error: 'Invalid client id' });
  }
});

export default router;



