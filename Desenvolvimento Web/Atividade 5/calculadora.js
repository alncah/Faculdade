
const valorConta = 365;
const percentualGorjeta = 12;


const valorGorjeta = valorConta * (percentualGorjeta / 100);

const valorTotal = valorConta + valorGorjeta;

console.log(
  `Valor da Conta: R$${valorConta.toFixed(2)} ` +
  `\nGorjeta (${percentualGorjeta}%): R$${valorGorjeta.toFixed(2)} ` +
  `\n\nTotal a pagar: R$${valorTotal.toFixed(2)}`
);