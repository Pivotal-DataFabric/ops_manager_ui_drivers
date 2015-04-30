module OpsManagerUiDrivers
  module Version11
    class VsphereConfiguration
      def initialize(browser:, product_id:)
        @browser = browser
        @product_id = product_id
      end

      def configure(vsphere_configuration)
        open_vsphere_configuration
        configure_vsphere(vsphere_configuration)
      end

      private

      attr_reader :browser, :product_id

      def open_vsphere_configuration
        browser.visit("/components/#{product_id}/forms/vsphere/edit")
      end

      def configure_vsphere(vsphere_configuration)
        browser.fill_in 'vsphere[network]', with: vsphere_configuration['network']
        browser.fill_in 'vsphere[datacenter]', with: vsphere_configuration['datacenter']
        browser.fill_in 'vsphere[cluster]', with: vsphere_configuration['cluster']
        browser.fill_in 'vsphere[datastore]', with: vsphere_configuration['datastore']
        browser.click_on 'Save'
      end
    end
  end
end
