module Admin
  class PlanFeaturesController < BaseController
    before_action :set_plan

    def create
      feature = Feature.find(params[:feature_id])
      @plan.features << feature unless @plan.features.include?(feature)
      redirect_to admin_plan_path(@plan), notice: "Feature added to plan successfully."
    end

    def destroy
      plan_feature = @plan.plan_features.find(params[:id])
      plan_feature.destroy
      redirect_to admin_plan_path(@plan), notice: "Feature removed from plan successfully."
    end

    private

    def set_plan
      @plan = Plan.find(params[:plan_id])
    end
  end
end
