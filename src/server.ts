import express from 'express';

function startServer() {
  const app = express();
  app.get('/health-check', (_, res: express.Response) => {
    res.sendStatus(200);
  });
  app.listen(process.env.PORT || 5000);
}

if (require.main === module) {
  startServer();
}
