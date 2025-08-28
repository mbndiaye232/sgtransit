"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
require("./config/env");
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const prisma_1 = __importDefault(require("./prisma"));
const app = (0, express_1.default)();
app.use((0, cors_1.default)());
app.use(express_1.default.json());
app.get('/health', (_req, res) => {
    res.json({ status: 'ok' });
});
app.get('/health/db', async (_req, res) => {
    try {
        await prisma_1.default.$queryRaw `SELECT 1`;
        res.json({ db: 'ok' });
    }
    catch (err) {
        res.status(500).json({ db: 'error' });
    }
});
const port = process.env.PORT ? Number(process.env.PORT) : 3001;
app.listen(port, () => {
    console.log(`API listening on http://localhost:${port}`);
});
