import { LightningElement, wire, track } from 'lwc';

import getAccounts from '@salesforce/apex/AccountConsoleController.getAccounts';
import updateIndustries from '@salesforce/apex/AccountConsoleController.updateIndustries';

import { refreshApex } from '@salesforce/apex';

const COLUMNS = [

    {
        label: 'Account Name',
        fieldName: 'Name',
        type: 'text'
    },

    {
        label: 'Industries',
        fieldName: 'Industries__c',
        type: 'text'
    },

    {
        type: 'button',
        typeAttributes: {
            label: 'Edit',
            name: 'edit',
            variant: 'brand'
        }
    }
];

export default class AccountConsole extends LightningElement {

    columns = COLUMNS;

    @track accounts;

    wiredResult;

    showModal = false;

    selectedAccountId;

    selectedIndustries = [];

    industryOptions = [
        { label: 'Banking', value: 'Banking' },
        { label: 'Healthcare', value: 'Healthcare' },
        { label: 'IT', value: 'IT' },
        { label: 'Education', value: 'Education' },
        { label: 'Retail', value: 'Retail' }
    ];

    @wire(getAccounts)
    wiredAccounts(result) {

        this.wiredResult = result;

        if(result.data) {
            this.accounts = result.data;
        }
        else if(result.error) {
            console.error(result.error);
        }
    }

    handleRowAction(event) {

        const row = event.detail.row;

        this.selectedAccountId = row.Id;

        if(row.Industries__c) {
            this.selectedIndustries =
                row.Industries__c.split(';');
        }
        else {
            this.selectedIndustries = [];
        }

        this.showModal = true;
    }

    handleChange(event) {

        this.selectedIndustries = event.detail.value;
    }

    closeModal() {

        this.showModal = false;
    }

    saveIndustries() {

        const finalValue =
            this.selectedIndustries.join(';');

        updateIndustries({
            accId: this.selectedAccountId,
            industries: finalValue
        })
        .then(() => {

            this.showModal = false;

            return refreshApex(this.wiredResult);
        })
        .catch(error => {
            console.error(error);
        });
    }
}