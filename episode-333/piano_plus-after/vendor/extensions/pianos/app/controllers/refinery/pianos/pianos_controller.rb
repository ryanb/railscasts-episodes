module Refinery
  module Pianos
    class PianosController < ::ApplicationController

      before_filter :find_all_pianos
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @piano in the line below:
        present(@page)
      end

      def show
        @piano = Piano.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @piano in the line below:
        present(@page)
      end

    protected

      def find_all_pianos
        @pianos = Piano.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/pianos").first
      end

    end
  end
end
