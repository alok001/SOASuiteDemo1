xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://tech.com/CustomerService";
(:: import schema at "../Schema/CustomerService.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/RemoveCustomerService";
(:: import schema at "../DBArtifacts/RemoveCustomerService_sp.xsd" ::)

declare variable $removeCust as element() (:: schema-element(ns1:removeCustomerRequest) ::) external;

declare function local:func($removeCust as element() (:: schema-element(ns1:removeCustomerRequest) ::)) as element() (:: schema-element(ns2:InputParameters) ::) {
    <ns2:InputParameters>
        <ns2:C_ID>{fn:data($removeCust/ns1:Id)}</ns2:C_ID>
    </ns2:InputParameters>
};

local:func($removeCust)
