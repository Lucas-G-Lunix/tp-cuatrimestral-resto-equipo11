function validate() {

	// Get our input reference.
	var emailField = document.getElementById('txtEmail');

	// Define our regular expression.
    var validEmail = /^[A-Za-z0-9_!#$%&'*+\/=?`{|}~^.-]+@[A-Za-z0-9.-]+$/;

	// Using test we can check if the text match the pattern
	if (validEmail.test(emailField.value) || ) {
		alert('Email is valid, continue with form submission');
		return true;
	} else {
		alert('Email is invalid, skip form submission');
		return false;
	}

	const input = document.querySelector('txtNombre')

	input.addEventListener('txtNombre', evt => {
		const value = input.value

		if (!value) {
			input.dataset.state = ''
			return
		}

		const trimmed = value.trim()

		if (trimmed) {
			input.dataset.state = 'valid'
		} else {
			input.dataset.state = 'invalid'
		}
	})

	const input = document.querySelector('txtApellido')

	input.addEventListener('txtApellido', evt => {
		const value = input.value

		if (!value) {
			input.dataset.state = ''
			return
		}

		const trimmed = value.trim()

		if (trimmed) {
			input.dataset.state = 'valid'
		} else {
			input.dataset.state = 'invalid'
		}
	})
}