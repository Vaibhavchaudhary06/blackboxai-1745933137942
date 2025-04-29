import React from 'react';

export default function Earnings() {
  const totalSalesToday = 15000;
  const totalSalesMonth = 450000;
  const pendingPayments = 5000;
  const commissionRate = 0.1; // 10%
  const commission = totalSalesMonth * commissionRate;

  const handleDownloadInvoice = () => {
    // TODO: Implement invoice download
    alert('Invoice download initiated');
  };

  return (
    <div className="min-h-screen bg-black text-yellow-500 p-6">
      <h1 className="text-3xl font-bold mb-6">Vendor Earnings</h1>

      <div className="bg-gray-900 p-6 rounded mb-6">
        <p className="mb-2">Total Sales Today: ₹{totalSalesToday.toLocaleString()}</p>
        <p className="mb-2">Total Sales This Month: ₹{totalSalesMonth.toLocaleString()}</p>
        <p className="mb-2">Pending Payments: ₹{pendingPayments.toLocaleString()}</p>
        <p className="mb-2">Commission Breakdown (10%): ₹{commission.toLocaleString()}</p>
      </div>

      <button
        onClick={handleDownloadInvoice}
        className="bg-yellow-500 text-black px-6 py-3 rounded hover:bg-yellow-600 transition"
      >
        Download Invoice
      </button>
    </div>
  );
}
