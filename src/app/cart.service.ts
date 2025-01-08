import { Injectable } from '@angular/core';

export interface Product {
  id: number;
  name: string;
  description: string;
  price: number;
  img_url: string;
  rating: number;
}

@Injectable({
  providedIn: 'root',
})
export class CartService {
  private cart: Product[] = [];

  constructor() {}
  addToCart(product: Product): void {
    console.log(`Adding product to cart: `, product);
    this.cart.push(product);
  }
  getCartItems(): Product[] {
    console.log('Fetching cart items: ', this.cart);
    return this.cart;
  }
  getTotalPrice(): number {
    const totalPrice = this.cart.reduce((total, product) => total + Number(product.price), 0);
    console.log('Total price of cart: ', totalPrice);
    return totalPrice;
  }

  clearCart(): void {
    console.log('Clearing cart');
    this.cart = [];
  }
}
