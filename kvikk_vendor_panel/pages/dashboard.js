import React, { useState } from 'react';

const initialProducts = [
  { id: 1, name: 'Sketchbook', price: 250, inStock: true },
  { id: 2, name: 'Watercolor Set', price: 1200, inStock: true },
  { id: 3, name: 'Canvas', price: 800, inStock: false },
];

const initialOrders = [
  { id: 101, customer: 'John Doe', status: 'Pending' },
  { id: 102, customer: 'Jane Smith', status: 'Accepted' },
];

export default function Dashboard() {
  const [products, setProducts] = useState(initialProducts);
  const [orders, setOrders] = useState(initialOrders);
  const [newProductName, setNewProductName] = useState('');
  const [newProductPrice, setNewProductPrice] = useState('');
  const [newProductImage, setNewProductImage] = useState(null);

  const handleToggleStock = (id) => {
    setProducts(products.map(p => p.id === id ? { ...p, inStock: !p.inStock } : p));
  };

  const handleAddProduct = (e) => {
    e.preventDefault();
    if (!newProductName || !newProductPrice) return;
    const newProduct = {
      id: products.length + 1,
      name: newProductName,
      price: parseFloat(newProductPrice),
      inStock: true,
    };
    setProducts([...products, newProduct]);
    setNewProductName('');
    setNewProductPrice('');
    setNewProductImage(null);
  };

  const handleAcceptOrder = (id) => {
    setOrders(orders.map(o => o.id === id ? { ...o, status: 'Accepted' } : o));
  };

  const handleRejectOrder = (id) => {
    setOrders(orders.map(o => o.id === id ? { ...o, status: 'Rejected' } : o));
  };

  return (
    <div className="min-h-screen bg-black text-yellow-500 p-6">
      <h1 className="text-3xl font-bold mb-6">Vendor Dashboard</h1>

      <section className="mb-8">
        <h2 className="text-xl font-semibold mb-4">Live Orders</h2>
        {orders.length === 0 ? (
          <p>No live orders</p>
        ) : (
          <ul>
            {orders.map(order => (
              <li key={order.id} className="mb-2 bg-gray-900 p-4 rounded flex justify-between items-center">
                <div>
                  <p>Order #{order.id} - {order.customer}</p>
                  <p>Status: {order.status}</p>
                </div>
                <div>
                  {order.status === 'Pending' && (
                    <>
                      <button
                        onClick={() => handleAcceptOrder(order.id)}
                        className="bg-yellow-500 text-black px-3 py-1 rounded mr-2 hover:bg-yellow-600"
                      >
                        Accept
                      </button>
                      <button
                        onClick={() => handleRejectOrder(order.id)}
                        className="bg-red-600 px-3 py-1 rounded hover:bg-red-700"
                      >
                        Reject
                      </button>
                    </>
                  )}
                </div>
              </li>
            ))}
          </ul>
        )}
      </section>

      <section className="mb-8">
        <h2 className="text-xl font-semibold mb-4">Product Listing</h2>
        <ul>
          {products.map(product => (
            <li key={product.id} className="mb-2 bg-gray-900 p-4 rounded flex justify-between items-center">
              <div>
                <input
                  type="text"
                  value={product.name}
                  onChange={(e) => {
                    const newName = e.target.value;
                    setProducts(products.map(p => p.id === product.id ? { ...p, name: newName } : p));
                  }}
                  className="bg-black text-yellow-500 border border-yellow-500 rounded px-2 py-1 mr-4"
                />
                <input
                  type="number"
                  value={product.price}
                  onChange={(e) => {
                    const newPrice = parseFloat(e.target.value);
                    setProducts(products.map(p => p.id === product.id ? { ...p, price: newPrice } : p));
                  }}
                  className="bg-black text-yellow-500 border border-yellow-500 rounded px-2 py-1 w-20"
                />
              </div>
              <div>
                <label className="mr-2">In Stock</label>
                <input
                  type="checkbox"
                  checked={product.inStock}
                  onChange={() => handleToggleStock(product.id)}
                  className="accent-yellow-500"
                />
              </div>
            </li>
          ))}
        </ul>
      </section>

      <section className="mb-8">
        <h2 className="text-xl font-semibold mb-4">Add New Product</h2>
        <form onSubmit={handleAddProduct} className="bg-gray-900 p-4 rounded">
          <input
            type="text"
            placeholder="Product Name"
            value={newProductName}
            onChange={(e) => setNewProductName(e.target.value)}
            className="w-full mb-2 p-2 rounded bg-black text-yellow-500 border border-yellow-500"
            required
          />
          <input
            type="number"
            placeholder="Price"
            value={newProductPrice}
            onChange={(e) => setNewProductPrice(e.target.value)}
            className="w-full mb-2 p-2 rounded bg-black text-yellow-500 border border-yellow-500"
            required
          />
          {/* Photo upload can be implemented later */}
          <button
            type="submit"
            className="bg-yellow-500 text-black px-4 py-2 rounded hover:bg-yellow-600 transition"
          >
            Add Product
          </button>
        </form>
      </section>

      <section>
        <h2 className="text-xl font-semibold mb-4">Notifications</h2>
        <ul>
          <li className="mb-2 bg-gray-900 p-4 rounded">New Order Received</li>
          <li className="mb-2 bg-gray-900 p-4 rounded">Stock Low Alert</li>
        </ul>
      </section>
    </div>
  );
}
