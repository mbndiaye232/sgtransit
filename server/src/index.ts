import './config/env';
import express, { Request, Response } from 'express';
import cors from 'cors';
import prisma from './prisma';
import clientsRouter from './routes/clients';

const app = express();
app.use(cors());
app.use(express.json());

app.get('/health', (_req: Request, res: Response) => {
	res.json({ status: 'ok' });
});

// Avoid 404 noise for favicon when hitting API URLs in a browser
app.get('/favicon.ico', (_req: Request, res: Response) => {
	res.sendStatus(204);
});

app.get('/health/db', async (_req: Request, res: Response) => {
	try {
		await prisma.$queryRaw`SELECT 1`;
		res.json({ db: 'ok' });
	} catch (err) {
		res.status(500).json({ db: 'error' });
	}
});

app.use('/clients', clientsRouter);

const port = process.env.PORT ? Number(process.env.PORT) : 3001;
app.listen(port, () => {
	console.log(`API listening on http://localhost:${port}`);
}); 