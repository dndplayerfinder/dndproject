const passport=require('passport');
const LocalStrategy=require('passport-local').Strategy;

passport.use('local.singup', new LocalStrategy({
    usernameField: 'login',
    passwordField: 'pwd',
    passReqToCallback: true
}))