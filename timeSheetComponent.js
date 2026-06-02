import { LightningElement, wire, track } from 'lwc';

import getFilteredData from '@salesforce/apex/TimeSheetComponent.getTimeSheet';
import submitForApproval from '@salesforce/apex/TimeSheetApprovalController.submitForApproval';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';

import TIMESHEET_OBJECT from '@salesforce/schema/TimeSheet__c';
import MONTH_FIELD from '@salesforce/schema/TimeSheet__c.Months__c';
import YEAR_FIELD from '@salesforce/schema/TimeSheet__c.Year__c';

export default class TimeSheetComponent extends LightningElement {

    // =========================
    // VARIABLES
    // =========================

    selectedMonth = '';
    selectedYear = '';

    selectedStartDate;
    selectedEndDate;

    selectedWorkingDate = null;

    selectedTimesheetId;

    @track data = [];
    @track workingDaysList = [];

    monthOptions = [];
    yearOptions = [];

    objectInfo;

    // =========================
    // LOAD DEFAULT VALUES
    // =========================
connectedCallback() {

    this.selectedMonth = '';
    this.selectedYear = '';

    this.data = [];

    this.workingDaysList = [];

    this.selectedWorkingDate = null;
}

    // =========================
    // OBJECT INFO
    // =========================

    @wire(getObjectInfo, { objectApiName: TIMESHEET_OBJECT })
    wiredObjectInfo({ data }) {
        if (data) {
            this.objectInfo = data;
        }
    }

    // =========================
    // MONTH PICKLIST
    // =========================

    @wire(getPicklistValues, {
        recordTypeId: '$objectInfo.defaultRecordTypeId',
        fieldApiName: MONTH_FIELD
    })
    wiredMonth({ data }) {

        if (data) {
            this.monthOptions = data.values;
        }
    }

    // =========================
    // YEAR PICKLIST
    // =========================

    @wire(getPicklistValues, {
        recordTypeId: '$objectInfo.defaultRecordTypeId',
        fieldApiName: YEAR_FIELD
    })
    wiredYear({ data }) {

        if (data) {
            this.yearOptions = data.values;
        }
    }

    // =========================
    // GETTERS
    // =========================

    get hasData() {
        return this.data.length > 0;
    }

    get hasWorkingDays() {
        return this.workingDaysList.length > 0;
    }

    // =========================
    // MONTH YEAR CHANGE
    // =========================

    handleMonthChange(event) {

        this.selectedMonth = event.detail.value;

    }

    handleYearChange(event) {

        this.selectedYear = event.detail.value;

    }

    // =========================
    // FETCH TIMESHEET DATA
    // =========================

    handleSubmit() {

        if (!this.selectedMonth || !this.selectedYear) {

            this.toast(
                'Error',
                'Please select Month and Year',
                'error'
            );

            return;
        }

        getFilteredData({
            month: this.selectedMonth,
            year: parseInt(this.selectedYear)
        })

        .then(result => {

            this.data = result;

            // hide working days until row selected
            this.workingDaysList = [];
            this.selectedWorkingDate = null;
        })

        .catch(() => {

            this.toast(
                'Error',
                'Error fetching data',
                'error'
            );
        });
    }

    // =========================
    // ROW SELECTION
    // =========================

    handleRowSelection(event) {

        this.selectedStartDate = event.target.dataset.start;

        this.selectedEndDate = event.target.dataset.end;

        this.selectedTimesheetId = event.target.dataset.id;

        this.selectedWorkingDate = null;

        const start = new Date(this.selectedStartDate);

        const end = new Date(this.selectedEndDate);

        let temp = [];

        let current = new Date(start);

        while (current <= end) {

            let day = current.getDay();

            // REMOVE WEEKENDS
            if (day !== 0 && day !== 6) {

                temp.push({

                    fullDate: current.toISOString().split('T')[0],

                    date: current.toLocaleDateString(),

                    dayName: [
                        'Sunday',
                        'Monday',
                        'Tuesday',
                        'Wednesday',
                        'Thursday',
                        'Friday',
                        'Saturday'
                    ][day]
                });
            }

            current.setDate(current.getDate() + 1);
        }

        this.workingDaysList = temp;
    }

    // =========================
    // DATE SELECT
    // =========================

    handleDateSelect(event) {

        this.selectedWorkingDate = event.target.value;
    }

    // =========================
    // APPROVAL SUBMIT
    // =========================

    handleRowSubmit(event) {

        const recordId = event.target.dataset.id;

        submitForApproval({ recordId })

            .then(() => {

                this.toast(
                    'Success',
                    'Submitted for Approval',
                    'success'
                );

                // refresh data
                this.handleSubmit();
            })

            .catch(error => {

                this.toast(
                    'Error',
                    error.body.message,
                    'error'
                );
            });
    }

    // =========================
    // TOAST
    // =========================

    toast(title, message, variant) {

        this.dispatchEvent(

            new ShowToastEvent({
                title,
                message,
                variant
            })
        );
    }
}