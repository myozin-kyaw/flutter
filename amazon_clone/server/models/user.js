const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    name: {
        trim: true,
        type: String,
        required: true,
    },
    email: {
        trim: true,
        type: String,
        required: true,
        validate: {
            validator: (value) => {
                const regex = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;;
                return value.match(regex);
            },
            message: 'Invalid email address',
        },
    },
    password: {
        trim: true,
        type: String,
        required: true,
        validate: {
            validator: (value) => {
                return value.length > 6;
            },
            message: 'Password field must have minimun 6 characters',
        },
    },
    address: {
        trim: true,
        type: String,
        default: 'test',
    },
    type: {
        trim: true,
        type: String,
        default: 'user',
    }
});

const User = mongoose.model('User', userSchema);

module.exports = User;