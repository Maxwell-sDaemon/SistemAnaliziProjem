const User = require('../models/user');

module.exports.renderRegister = (req, res) => {
    res.render('users/register');
}

module.exports.register = async (req, res, next) => {
    try {
        const { email, username, password,hesCode } = req.body;
        const user = new User({ email, username,hesCode });
        const registeredUser = await User.register(user, password);//hess kodu sonra yapılacak
        req.login(registeredUser, err => {
            if (err) return next(err);
            req.flash('success', 'RestO_ORant a Hoşgeldiniz!');
            res.redirect('/campgrounds');
        })
    } catch (e) {
        req.flash('error', e.message);
        res.redirect('register');
    }
}

module.exports.renderLogin = (req, res) => {
    res.render('users/login');
}

module.exports.login = (req, res) => {
    req.flash('success', 'Tekrar Hoşgeldiniz.');
    const redirectUrl = req.session.returnTo || '/campgrounds';
    delete req.session.returnTo;
    res.redirect(redirectUrl);
}

module.exports.logout = (req, res) => {
    req.logout();
    // req.session.destroy();
    req.flash('success', "Görüşmek Üzere!");
    res.redirect('/campgrounds');
}