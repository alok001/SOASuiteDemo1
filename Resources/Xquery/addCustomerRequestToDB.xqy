xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://tech.com/CustomerService";
(:: import schema at "../Schema/CustomerService.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/dbReference";
(:: import schema at "../dbReference_sp.xsd" ::)

declare variable $addCustomer as element() (:: schema-element(ns1:addCustomerRequest) ::) external;

declare function local:func($addCustomer as element() (:: schema-element(ns1:addCustomerRequest) ::)) as element() (:: schema-element(ns2:InputParameters) ::) {
    <ns2:InputParameters>
        <ns2:C_ID>{fn:data($addCustomer/ns1:Id)}</ns2:C_ID>
        <ns2:C_NAME>{fn:data($addCustomer/ns1:name)}</ns2:C_NAME>
        <ns2:C_CITY>{fn:data($addCustomer/ns1:city)}</ns2:C_CITY>
        <ns2:C_PROFESSION>{fn:data($addCustomer/ns1:profession)}</ns2:C_PROFESSION>
    </ns2:InputParameters>
};

local:func($addCustomer)
