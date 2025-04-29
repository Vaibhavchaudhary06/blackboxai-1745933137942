import React, { useState } from 'react';

export default function LoginPage() {
  const [vendorId, setVendorId] = useState('');
  const [password, setPassword] = useState('');

  const handleLogin = (e) => {
    e.preventDefault();
    // TODO: Implement vendor login logic
    alert('Login attempted for Vendor ID: ' + vendorId);
  };

  return (
    <div className="min-h-screen bg-black flex items-center justify-center">
      <form
        onSubmit={handleLogin}
        className="bg-gray-900 p-8 rounded-lg shadow-lg w-full max-w-md"
      >
        <h2 className="text-yellow-500 text-2xl font-bold mb-6 text-center">
          Vendor Login
        </h2>
        <label className="block mb-2 text-yellow-500 font-semibold" htmlFor="vendorId">
          Vendor ID
        </label>
        <input
          id="vendorId"
          type="text"
          value={vendorId}
          onChange={(e) => setVendorId(e.target.value)}
          className="w-full p-2 mb-4 rounded bg-black text-yellow-500 border border-yellow-500 focus:outline-none focus:ring-2 focus:ring-yellow-500"
          required
        />
        <label className="block mb-2 text-yellow-500 font-semibold" htmlFor="password">
          Password
        </label>
        <input
          id="password"
          type="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          className="w-full p-2 mb-6 rounded bg-black text-yellow-500 border border-yellow-500 focus:outline-none focus:ring-2 focus:ring-yellow-500"
          required
        />
        <button
          type="submit"
          className="w-full bg-yellow-500 text-black font-bold py-2 rounded hover:bg-yellow-600 transition"
        >
          Login
        </button>
      </form>
    </div>
  );
}
