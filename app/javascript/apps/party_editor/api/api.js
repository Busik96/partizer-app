import axios from 'axios';

const api = axios.create({
  baseURL: 'http://localhost:5000/api/v1',
  headers: { 'Authorization': window.API_TOKEN }
});

export default api;
