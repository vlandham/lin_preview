class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.xml
  def index
    @groups = Group.find(:all)

    respond_to do |wants|
      wants.html {
              @graph = graph_code
              @graph_pie = open_flash_chart_object(200,200, url_for(:action => "pie_chart"))
              @graph_pie2 =open_flash_chart_object(200,200, url_for(:action => "pie_chart2"))
              @graph_pie3 =open_flash_chart_object(200,200, url_for(:action => "pie_chart3"))
              @graph_pie4 =open_flash_chart_object(200,200, url_for(:action => "pie_chart4"))
              @long_graph=open_flash_chart_object(920,200, url_for(:action => "long_graph"))
            }
            wants.json { 
              chart = graph_code
              render :text => chart, :layout => false
            }
    end
  end
  
  def data_traffic
    grid_color = '#979797'
     chart = OpenFlashChart.new
     title = Title.new("Data vs Time")
     chart.set_title(title)
     chart.colour = '#E7E7E7'
     
       s = ScatterLine.new( '#CCE691',2)
       # s.values = [ScatterValue.new(50,30)]
       25.times do |x|
            s.append_value(ScatterValue.new(x*30, x*rand(40)))
       end
       chart.add_element(s)
       s = ScatterLine.new( '#C12691',2)
       25.times do |x|
             s.append_value(ScatterValue.new(x*30, x*rand(50)))
        end
       chart.add_element(s)
       x = XAxis.new
       x.set_range(0,650,100)
       x.colour = grid_color
       x.set_grid_colour grid_color
       chart.set_x_axis(x)
       y = YAxis.new
       y.set_range(0,800,200)
       y.colour = grid_color
       y.set_grid_colour grid_color
       chart.set_y_axis(y)
       render :text => chart.to_s
  end
  
  def graph_code
    grid_color = '#979797'
     chart = OpenFlashChart.new
     title = Title.new("Packets vs Time")
     chart.set_title(title)
     chart.colour = '#E7E7E7'
     
       s = ScatterLine.new( '#CCE691',2)
       # s.values = [ScatterValue.new(50,30)]
       25.times do |x|
            s.append_value(ScatterValue.new(x*30, x*rand(40)))
       end
       chart.add_element(s)
       s = ScatterLine.new( '#C12691',2)
       25.times do |x|
             s.append_value(ScatterValue.new(x*30, x*rand(50)))
        end
       chart.add_element(s)
       x = XAxis.new
       x.set_range(0,650,100)
       x.colour = grid_color
       x.set_grid_colour grid_color
       chart.set_x_axis(x)
       y = YAxis.new
       y.set_range(0,800,200)
       y.colour = grid_color
       y.set_grid_colour grid_color
       chart.set_y_axis(y)
       chart
  end
  
  def pie_chart
    title = Title.new("Pie Chart Example For Other")

        pie = Pie.new
        pie.start_angle = 35
        pie.animate = true
        pie.tooltip = '#val# of #total#<br>#percent# of 100%'
        pie.colours = ["#d01f3c", "#356aa0", "#C79810"]
        pie.values  = [2,3, PieValue.new(6.5,"Hello (6.5)")]

        chart = OpenFlashChart.new
        chart.title = title
        chart.add_element(pie)

        chart.x_axis = nil

        render :text => chart.to_s
  end
  
  def pie_chart2
    title = Title.new("Pie Chart Example For Chipster")

        pie = Pie.new
        pie.start_angle = 35
        pie.animate = true
        pie.tooltip = '#val# of #total#<br>#percent# of 100%'
        pie.colours = ["#d01f3c", "#356aa0", "#C79810"]
        pie.values  = [2,3, PieValue.new(6.5,"Hello (6.5)")]

        chart = OpenFlashChart.new
        chart.title = title
        chart.add_element(pie)

        chart.x_axis = nil

        render :text => chart.to_s
  end
  
  def pie_chart3
    title = Title.new("Pie Chart Example For Chipster")

        pie = Pie.new
        pie.start_angle = 35
        pie.animate = true
        pie.tooltip = '#val# of #total#<br>#percent# of 100%'
        pie.colours = ["#d01f3c", "#356aa0", "#C79810"]
        pie.values  = [2,3, PieValue.new(6.5,"Hello (6.5)")]

        chart = OpenFlashChart.new
        chart.title = title
        chart.add_element(pie)

        chart.x_axis = nil

        render :text => chart.to_s
  end
  
  def pie_chart4
    title = Title.new("Pie Chart Example For Chipster")

        pie = Pie.new
        pie.start_angle = 35
        pie.animate = true
        pie.tooltip = '#val# of #total#<br>#percent# of 100%'
        pie.colours = ["#d01f3c", "#356aa0", "#C79810"]
        pie.values  = [2,3, PieValue.new(6.5,"Hello (6.5)")]

        chart = OpenFlashChart.new
        chart.title = title
        chart.add_element(pie)

        chart.x_axis = nil

        render :text => chart.to_s
  end
  
  
  def long_graph
      # based on this example - http://teethgrinder.co.uk/open-flash-chart-2/tooltip.php
      title = Title.new("MultiBar Tooltip")

      bar = Bar.new
      bar.values  = [9,8,7,6,5,4,3,2,1]
      bar.tooltip = "Title Bar l<br>val = #val#"
      bar.colour  = '#47092E'

      # NOTE: you can use obj.variable=() or obj.set_variable() interchangeably

      bar2 = Bar.new
      bar2.set_tooltip("Spoon {#val#}<br>Title Bar 2")
      bar2.set_colour('#CC2A43')

      vals = [1,2,3,4]

      tmp = BarValue.new(5)
      tmp.set_colour('#000000')
      tmp.set_tooltip("Spoon {#val#}<br>Title Bar 2<br>Override bar 2 tooltip<br>Special data point")
      vals << tmp
      vals << [6,7,8,9]
      vals = vals.flatten

      bar2.values = vals

      t = Tooltip.new
      t.set_shadow(false)
      t.stroke = 5
      t.colour = '#6E604F'
      t.set_background_colour("#BDB396")
      t.set_title_style("{font-size: 14px; color: #CC2A43;}")
      t.set_body_style("{font-size: 10px; font-weight: bold; color: #000000;}")

      chart = OpenFlashChart.new
      chart.title = title
      chart.add_element(bar)
      chart.add_element(bar2)
      chart.set_tooltip(t)

      render :text => chart.to_s
    end
  

  # GET /groups/1
  # GET /groups/1.xml
  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.xml
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.xml
  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        flash[:notice] = 'Group was successfully created.'
        format.html { redirect_to(@group) }
        format.xml  { render :xml => @group, :status => :created, :location => @group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.xml
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        flash[:notice] = 'Group was successfully updated.'
        format.html { redirect_to(@group) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.xml
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to(groups_url) }
      format.xml  { head :ok }
    end
  end
end
