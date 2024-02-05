/**
 * Import from packages
 */
const express = require('express');

/**
 * Import from other files
 */
const authRouter = require('./routes/auth');
const { default: mongoose } = require('mongoose');

/**
 * initialization 
 */
const PORT = 3000;
const app = express();
// const DB = 'mongodb+srv://myozinkyaw:<password>@cluster0.axia3ax.mongodb.net/?retryWrites=true&w=majority';

/**
 * middleware
 */
app.use(express.json());
app.use(authRouter);

/**
 * Connections
 */
mongoose
    .connect(DB)
    .then(() => console.log('Connected successfully'))
    .catch((e) => console.log(e));

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Connected to the port ${PORT}`);
});

app.get('/', function (req, res) {
    return res.json({ message: 'Connedted' });
});