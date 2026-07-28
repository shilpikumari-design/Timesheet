import { LightningElement, api } from 'lwc';

export default class WorkingDaysComponent extends LightningElement {

    _startDate;
    _endDate;

    workingDays = [];

    selectedDate;

    // =========================
    // START DATE
    // =========================

    @api
    set startDate(value) {

        this._startDate = value;

        this.generateWorkingDays();
    }

    get startDate() {

        return this._startDate;
    }

    // =========================
    // END DATE
    // =========================

    @api
    set endDate(value) {

        this._endDate = value;

        this.generateWorkingDays();
    }

    get endDate() {

        return this._endDate;
    }

    // =========================
    // GENERATE WORKING DAYS
    // =========================

    generateWorkingDays() {

        if (!this._startDate || !this._endDate) {
            return;
        }

        let start = new Date(this._startDate);

        let end = new Date(this._endDate);

        let temp = [];

        while (start <= end) {

            let dayNumber = start.getDay();

            // EXCLUDE WEEKENDS
            if (dayNumber !== 0 && dayNumber !== 6) {

                temp.push({

                    fullDate: start.toISOString().split('T')[0],

                    dayName: [
                        'Sunday',
                        'Monday',
                        'Tuesday',
                        'Wednesday',
                        'Thursday',
                        'Friday',
                        'Saturday'
                    ][dayNumber]
                });
            }

            start.setDate(start.getDate() + 1);
        }

        this.workingDays = temp;
    }

    // =========================
    // SELECT DATE
    // =========================

    handleDateSelect(event) {

        console.log('DATE SELECT METHOD CALLED');

        console.log('VALUE:', event.target.value);

        this.selectedDate = event.target.value;

        console.log('SELECTED DATE:', this.selectedDate);
    }
}