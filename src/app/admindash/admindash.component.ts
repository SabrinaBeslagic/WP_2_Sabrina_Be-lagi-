import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgIf, NgForOf } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  standalone: true,
  selector: 'app-admindash',
  templateUrl: './admindash.component.html',
  styleUrls: ['./admindash.component.css'],
  imports: [FormsModule, NgIf, NgForOf],
})
export class AdmindashComponent implements OnInit {
  protected users: any[] = []; // Lista korisnika
  protected user = {
    id: null,
    first_name: '',
    last_name: '',
    username: '',
    email: '',
    password: '',
    role: 'user', // Default role
  }; // Trenutno uređivani korisnik
  protected errors: string[] = [];
  protected isEditMode: boolean = false; // Flag za uređivanje

  private apiUrl = 'http://localhost/my-backend/admindash.php'; // Vaš API endpoint

  constructor(private router: Router) {}

  ngOnInit(): void {
    this.getUsers(); // Dohvati sve korisnike prilikom inicijalizacije
  }

  // Dohvati sve korisnike
  protected async getUsers(): Promise<void> {
    try {
      const res = await fetch(this.apiUrl);
      if (!res.ok) throw new Error('Greška pri dohvaćanju korisnika.');
      const data = await res.json();
      this.users = data.map((user: any) => ({
        id: user.ID,
        first_name: user.first_name,
        last_name: user.last_name,
        username: user.username,
        email: user.email,
        password: user.password,
        role: user.role,
      }));
    } catch (e: any) {
      this.errors.push(e.message || 'Greška pri dohvaćanju korisnika.');
      console.error(e.message);
    }
  }

  // Dodaj ili ažuriraj korisnika
  protected async onSubmit(): Promise<void> {
    this.errors = [];

    // Validacija
    if (!this.user.first_name.trim()) this.errors.push('Ime je obavezno.');
    if (!this.user.last_name.trim()) this.errors.push('Prezime je obavezno.');
    if (!this.user.username.trim()) this.errors.push('Korisničko ime je obavezno.');
    if (!this.user.email.trim()) this.errors.push('Email je obavezan.');

    if (this.errors.length > 0) return;

    try {
      const method = this.isEditMode ? 'PUT' : 'POST';
      const res = await fetch(this.apiUrl, {
        method,
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          ID: this.user.id,
          first_name: this.user.first_name,
          last_name: this.user.last_name,
          username: this.user.username,
          email: this.user.email,
          password: this.user.password,
          role: this.user.role,
        }),
      });

      if (!res.ok) throw new Error('Greška pri spremanju korisnika.');
      const data = await res.json();

      if (data.error) {
        this.errors.push(data.error);
        return;
      }

      this.getUsers(); // Osvježi listu korisnika
      this.resetForm();
      alert(this.isEditMode ? 'Korisnik ažuriran.' : 'Korisnik dodan.');
    } catch (e: any) {
      this.errors.push(e.message || 'Greška pri spremanju korisnika.');
      console.error(e.message);
    }
  }

  // Postavi korisnika za uređivanje
  protected editUser(user: any): void {
    this.user = { ...user };
    this.isEditMode = true;
  }

  // Obriši korisnika
  protected async deleteUser(id: number): Promise<void> {
    try {
      const res = await fetch(this.apiUrl, {
        method: 'DELETE',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ id }),
      });

      if (!res.ok) throw new Error('Greška pri brisanju korisnika.');
      const data = await res.json();

      if (data.error) {
        this.errors.push(data.error);
        return;
      }

      this.getUsers(); // Osvježi listu korisnika
      alert('Korisnik obrisan.');
    } catch (e: any) {
      this.errors.push(e.message || 'Greška pri brisanju korisnika.');
      console.error(e.message);
    }
  }

  // Resetuj formu
  protected resetForm(): void {
    this.user = {
      id: null,
      first_name: '',
      last_name: '',
      username: '',
      email: '',
      password: '',
      role: 'user',
    };
    this.isEditMode = false;
    this.errors = [];
  }
}
