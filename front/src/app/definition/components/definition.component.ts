import { Component, Input, OnInit } from '@angular/core';
import { Definition } from '../definition';

@Component({
  selector: 'app-definition',
  templateUrl: './definition.component.html',
  styleUrls: ['./definition.component.scss']
})
export class DefinitionComponent implements OnInit {

  @Input() public definition: Definition = {title: '', description: ''};

  constructor() { }

  ngOnInit(): void {
    console.log(this.definition)
  }

}
