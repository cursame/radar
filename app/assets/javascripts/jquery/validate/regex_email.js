jQuery.extend(jQuery.validator.methods, {
  email: function( value, element ) {
    return this.optional( element ) || /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]+/.test( value );
  }
});
