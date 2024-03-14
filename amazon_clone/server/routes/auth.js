const express = require('express');
const User = require('../models/user');
const bcryptjs = require('bcryptjs');

const authRouter = express.Router();

authRouter.post('/api/signup', async function (req, res) {
    try {
        const { name, email, password } = req.body;
        const existingUser = await User.findOne({ email });

        if (existingUser) {
            return res
                .status(400)
                .json({ message: 'User with same email is already exists.' });
        }

        const hashedPassword = await bcryptjs.hash(password, 8)

        let user = new User({
            name,
            email,
            password: hashedPassword
        });

        user = await user.save();

        res.json({ user });

    } catch (e) {
        return res.status(500).json({ message: e.message });
    }
});

module.exports = authRouter;