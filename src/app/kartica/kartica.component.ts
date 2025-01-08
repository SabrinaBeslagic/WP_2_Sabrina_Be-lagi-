import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { CartService } from '../cart.service'; // Import CartService

@Component({
  selector: 'app-kartica',
  standalone: true,
  imports: [CommonModule, HttpClientModule],
  templateUrl: './kartica.component.html',
  styleUrls: ['./kartica.component.css']
})
export class KarticaComponent implements OnInit {
  products: any[] = []; // Holds the list of products
  errorMessage: string = ''; // For displaying any errors (e.g., failed API requests)

  constructor(private http: HttpClient, private cartService: CartService) {}

  ngOnInit(): void {
    // Fetch products from the backend
    this.http.get<any[]>('http://localhost/my-backend/index.php') // Adjust the endpoint as needed
      .subscribe({
        next: (data) => {
          this.products = data;
        },
        error: (err) => {
          this.errorMessage = 'Failed to load products. Please try again later.';
          console.error(err);
        }
      });
  }

  // Method to add product to the cart
  addToCart(product: any): void {
    this.cartService.addToCart(product); // Add the selected product to the cart
    alert(`${product.name} has been added to your cart!`); // Feedback to the user
  }

  // Method for inspecting a product (you can extend this for a detailed view)
  inspectProduct(product: any): void {
    alert(`Inspecting: ${product.name}`); // Simple alert for inspecting a product
    // You could add more functionality, like routing to a detail page
  }
}
