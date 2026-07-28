import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

const FIELDS = [
    'Account.Name',
    'Account.Industry',
    'Account.Type',
    'Account.Owner.Name'
];

export default class Customer360Overview extends LightningElement {

    @api recordId;

    @wire(getRecord,{
        recordId:'$recordId',
        fields:FIELDS
    })
    account;

    get accountName(){
        return this.account?.data?.fields?.Name?.value;
    }

    get industry(){
        return this.account?.data?.fields?.Industry?.value;
    }

    get type(){
        return this.account?.data?.fields?.Type?.value;
    }

    get ownerName(){
        return this.account?.data?.fields?.Owner?.displayValue;
    }
}
