import { Component, OnInit } from '@angular/core';
import { CartService, Product } from '../cart.service';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css'],
  standalone: true,
  imports: [CommonModule]
})
export class CartComponent implements OnInit {
  cartItems: Product[] = [];
  totalPrice: number = 0;

  constructor(private cartService: CartService) {}

  ngOnInit(): void {

    this.cartItems = this.cartService.getCartItems();
    this.totalPrice = this.cartService.getTotalPrice();
  }
  clearCart(): void {
      this.cartService.clearCart();
      this.cartItems = [];
      this.totalPrice = 0;
    }
  checkout(): void {
      alert('You\'re all set, player! 🐺 Your gear is packed and your order is on its way! 🎮 Prepare for an epic gaming adventure at Wolfbyte Game Shop! 🚀');

    }
}
