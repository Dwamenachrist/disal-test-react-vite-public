import React from "react";
import { createRoot } from "react-dom/client";
import "./style.css";

function App() {
  return (
    <main className="shell">
      <p className="eyebrow">DISAL compatibility test</p>
      <h1>React + Vite is live</h1>
      <p>This static frontend was built by Vite and served through the assigned DISAL port.</p>
      <code>{window.location.host}</code>
    </main>
  );
}

createRoot(document.getElementById("root")).render(<App />);
