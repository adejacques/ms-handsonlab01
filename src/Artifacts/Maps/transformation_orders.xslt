<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Output method -->
  <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    
  <!-- Template to match the root element (booking) -->
  <xsl:template match="/booking">
    <transformedBooking>
      <!-- Booking ID -->
      <bookingId>
        <xsl:value-of select="bookingId"/>
      </bookingId>

      <!-- Passengers: create a list of names -->
      <passengerNames>
        <xsl:for-each select="passengers">
          <name>
            <xsl:value-of select="concat(firstName, ' ', lastName)"/>
          </name>
        </xsl:for-each>
      </passengerNames>

      <!-- Flight Details -->
      <flightDetails>
        <flightNumber>
          <xsl:value-of select="flight/flightNumber"/>
        </flightNumber>
        <departure>
          <xsl:value-of select="flight/origin"/>
        </departure>
        <arrival>
          <xsl:value-of select="flight/destination"/>
        </arrival>
        <departureDate>
          <xsl:value-of select="flight/departureDate"/>
        </departureDate>
      </flightDetails>

      <!-- Payment Information -->
      <payment>
        <cardType>
          <xsl:value-of select="payment/cardType"/>
        </cardType>
        <amountPaid>
          <xsl:value-of select="payment/totalPrice"/>
        </amountPaid>
      </payment>
    </transformedBooking>
  </xsl:template>

  <!-- Identity Template: copy everything else unchanged -->
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
