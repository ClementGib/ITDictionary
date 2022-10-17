import { Component, OnInit } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { Definition } from '../../definition/definition';
import definitions from '../../../assets/json/definitions.json'

@Component({
  selector: 'app-definitions',
  templateUrl: './definitions.component.html',
  styleUrls: ['./definitions.component.scss']
})
export class DefinitionsComponent implements OnInit {

  public definitions: Definition[] = definitions;

  constructor(private httpClient: HttpClient) { }

  ngOnInit(): void {
  }

}
