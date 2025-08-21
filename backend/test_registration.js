const axios = require('axios');

const registerUser = async () => {
  try {
    const response = await axios.post('http://localhost:5000/api/auth/register', {
      firstName: 'Test',
      lastName: 'User',
      email: 'uniqueemailtest@gmail.com', // Updated email
      password: '1234567890',
      role: 'patient',
    });
    console.log('Registration Response:', response.data);
  } catch (error) {
    console.error('Error during registration:', error.response?.data || error.message);
  }
};

registerUser();
