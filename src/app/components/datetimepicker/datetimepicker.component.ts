import { Component, OnInit, Input, forwardRef, ViewChild, AfterViewInit, Injector, Output, EventEmitter } from '@angular/core';
import { NgbTimeStruct, NgbDateStruct, NgbPopoverConfig, NgbPopover, NgbDatepicker } from '@ng-bootstrap/ng-bootstrap';
import { NG_VALUE_ACCESSOR, ControlValueAccessor, NgControl } from '@angular/forms';
import { DatePipe } from '@angular/common';
import { DateTimeModel } from './date-time.model';
import { noop } from 'rxjs';

@Component({
  selector: 'app-datetimepicker',
  templateUrl: './datetimepicker.component.html',
  styleUrls: ['./datetimepicker.component.scss'],
  providers: [
    DatePipe,
    {
        provide: NG_VALUE_ACCESSOR,
        useExisting: forwardRef(() => DatetimepickerComponent),
        multi: true
    }
]
})
export class DatetimepickerComponent implements ControlValueAccessor, OnInit, AfterViewInit {
  @Input()
  @Output() onDatePicked: EventEmitter<any> = new EventEmitter<any>();
  dateString: string;

  @Input()
  inputDatetimeFormat = 'd.M.yyyy H:mm';
  @Input()
  hourStep = 1;
  @Input()
  minuteStep = 30;
  @Input()
  secondStep = 30;
  @Input()
  seconds = false;

  @Input()
  disabled = false;

  timePickerContent

  public showTimePickerToggle = false;

  public datetime: DateTimeModel = new DateTimeModel();
  public firstTimeAssign = true;

  @ViewChild(NgbDatepicker)
  public dp: NgbDatepicker;

  

  @ViewChild(NgbPopover)
  public popover: NgbPopover;

  public onTouched: () => void = noop;
  public onChange: (_: any) => void = noop;

  public ngControl: NgControl;

  constructor(private config: NgbPopoverConfig, private inj: Injector ) {
      config.autoClose = 'outside';
      config.placement = 'auto';
  }

  ngOnInit(): void {
      this.ngControl = this.inj.get(NgControl);
  }

  ngAfterViewInit(): void {
      this.popover.hidden.subscribe($event => {
          this.showTimePickerToggle = false;
      });
      
  }

  close() {
    this.onDatePicked.emit(this.datetime);
    this.popover.close();
  }

  writeValue(newModel: string) {
      if (newModel) {
          this.datetime = Object.assign(this.datetime, DateTimeModel.fromLocalString(newModel));
          this.dateString = newModel;
          this.setDateStringModel();
      } else {
          this.datetime = new DateTimeModel();
      }
  }

  registerOnChange(fn: any): void {
      this.onChange = fn;
  }

  registerOnTouched(fn: any): void {
      this.onTouched = fn;
  }

  toggleDateTimeState($event) {
      this.showTimePickerToggle = !this.showTimePickerToggle;
      $event.stopPropagation();
  }

  setDisabledState?(isDisabled: boolean): void {
      this.disabled = isDisabled;
  }

  onInputChange($event: any) {
      const value = $event.target.value;
      const dt = DateTimeModel.fromLocalString(value);

      if (dt) {
          this.datetime = dt;
          this.setDateStringModel();
      } else if (value.trim() === '') {
          this.datetime = new DateTimeModel();
          this.dateString = '';
          this.onChange(this.dateString);
      } else {
            this.onChange(value);
      }
  }

  onDateChange($event: any | NgbDateStruct) {        
      if ($event.year){
        $event = `${$event.year}-${$event.month}-${$event.day}`
      }

      const date = DateTimeModel.fromLocalString($event);
 
      if (!date) {
          this.dateString = this.dateString;
          return;
      }

      if (!this.datetime) {
          this.datetime = date;
      }

      this.datetime.year = date.year;
      this.datetime.month = date.month;
      this.datetime.day = date.day;
      console.log(this.datetime);
      this.onDatePicked.emit(this.datetime);
      //this.dp.navigateTo({ year: date.year, month: date.month });
      console.log('test');
      this.setDateStringModel();
  }

  onTimeChange(event: NgbTimeStruct) {
      this.datetime.hour = event.hour;
      this.datetime.minute = event.minute;
      this.datetime.second = event.second;
      this.onDatePicked.emit(this.datetime);
      this.setDateStringModel();
  }

  setDateStringModel() {
      this.dateString = this.datetime.toString();

      if (!this.firstTimeAssign) {
          this.onChange(this.dateString);
      } else {
          // Skip very first assignment to null done by Angular
          if (this.dateString !== null) {
              this.firstTimeAssign = false;
          }
      }
  }

  inputBlur($event) {
      this.onTouched();
  }
}
