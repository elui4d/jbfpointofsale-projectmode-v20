<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:exsl4D="http://www.4D.com"
                xmlns:math="http://exslt.org/math"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                >
	<xsl:import href="graph_common.xsl" />

	<xsl:output method="xml" encoding="UTF-8" indent="yes" media-type="image/svg"/>

	<!-- top-level parameters -->

	<!-- category index -->

	<!-- viewport properties -->
	<xsl:param name="viewport_color" select="'white'" />
	<xsl:param name="viewport_opacity" select="0.0" />
	<xsl:param name="viewport_height" select="580" />
	<xsl:param name="viewport_width" select="720" />

  <!-- shape properties -->
  <xsl:param name="shape_rendering" select="'crispEdges'" />

	<!-- font properties -->
	<xsl:param name="font_color"             select="'darkgrey'" />
	<xsl:param name="font_family"            select="'Arial'" />
	<xsl:param name="font_size"              select="13" />
	<xsl:param name="font_width"             select="$font_size div 2" />
	<xsl:param name="font_descent"           select="$font_size div 10" />
	<xsl:param name="font_weight"            select="'normal'" />
	<xsl:param name="font_style"             select="'normal'" />
	<xsl:param name="font_decoration"        select="'none'" />
	<xsl:param name="font_filter"            select="'none'" />

  <!-- label format properties -->
  <xsl:param name="label_format_number" select="'############0.###'" />
  <xsl:param name="label_format_date"   select="'1'" />
  <xsl:param name="label_format_time"   select="'1'" />

  <xsl:param name="x_label_format_number" select="$label_format_number" />
  <xsl:param name="x_label_format_date"   select="$label_format_date" />
  <xsl:param name="x_label_format_time"   select="$label_format_time" />

  <xsl:param name="y_label_format_number" select="$label_format_number" />
  <xsl:param name="y_label_format_date"   select="$label_format_date" />
  <xsl:param name="y_label_format_time"   select="$label_format_time" />

	<!-- layout properties -->
	<xsl:param name="base_margin"             select="10" />

	<!-- shadow properties -->
	<xsl:param name="shadow_visible"          select="0"/>
	<xsl:param name="shadow_color"            select="'black'"/>
	<xsl:param name="shadow_offset_x"         select="8"/>
	<xsl:param name="shadow_offset_y"         select="8"/>

	<!-- title properties -->
	<xsl:param name="title_color"             select="$font_color" />
	<xsl:param name="title_font_family"       select="$font_family" />
	<xsl:param name="title_font_size"         select="20" />
	<xsl:param name="title_font_width"        select="$title_font_size div 2" />
	<xsl:param name="title_font_descent"      select="$title_font_size div 10" />
	<xsl:param name="title_font_weight"       select="'bold'" />
	<xsl:param name="title_font_style"        select="$font_style" />
	<xsl:param name="title_font_decoration"   select="$font_decoration" />
	<xsl:param name="title_font_filter"       select="$font_filter" />

	<xsl:param name="title_margin"            select="20" />

	<xsl:param name="title_border_visible"      select="1" />
	<xsl:param name="title_border_margin"       select="4" />
	<xsl:param name="title_border_fill_color"   select="'white'" />
	<xsl:param name="title_border_fill_opacity" select="0.6" />
	<xsl:param name="title_border_stroke_color" select="'lightgray'" />
	<xsl:param name="title_border_stroke_width" select="1" />

	<xsl:param name="title" select="''" />

	<!-- legend properties -->
	<xsl:param name="legend_color"            select="'black'" />
	<xsl:param name="legend_font_family"      select="$font_family" />
	<xsl:param name="legend_font_size"        select="12" />
	<xsl:param name="legend_font_width"       select="$legend_font_size div 2" />
	<xsl:param name="legend_font_descent"     select="$legend_font_size div 10" />
	<xsl:param name="legend_font_weight"      select="$font_weight" />
	<xsl:param name="legend_font_style"       select="$font_style" />
	<xsl:param name="legend_font_decoration"  select="$font_decoration" /> 
	<xsl:param name="legend_font_filter"      select="$font_filter" />

	<xsl:param name="legend_bullet_size"         select="20" /> 
	<xsl:param name="legend_bullet_filter"       select="'none'"/>
	<xsl:param name="legend_bullet_name"         select="'ID_legend_'"/>
	<xsl:param name="legend_bullet_stroke_color" select="'none'"/>

	<xsl:param name="legend_rect_fill_color"   select="'rgb(229,229,229)'" />
	<xsl:param name="legend_rect_fill_opacity" select="1" />
	<xsl:param name="legend_rect_stroke_color" select="'gray'" />
	<xsl:param name="legend_rect_stroke_width" select="0" />
	<xsl:param name="legend_rect_filter"       select="'none'"/>
	<xsl:param name="legend_visibility"        select="'hidden'"/>
	<xsl:param name="legend_rx"                select="10"/>
	<xsl:param name="legend_ry"                select="10"/>

	<!-- pie label properties -->
	<xsl:param name="pie_label_visible"           select="1" />
	<xsl:param name="pie_label_color"             select="$font_color" />
	<xsl:param name="pie_label_font_family"       select="$font_family" />
	<xsl:param name="pie_label_font_size"         select="15" />
	<xsl:param name="pie_label_font_width"        select="$pie_label_font_size div 2" />
<!--	<xsl:param name="pie_label_font_descent"      select="$pie_label_font_size div 10" /> -->
	<xsl:param name="pie_label_font_descent"      select="($pie_label_font_size div 2)*(-1)" />
	<!-- eloignemet des labels / centre -->
	<xsl:param name="pie_scalex" select="1.15" />
	<xsl:param name="pie_scaley" select="1.22" />
	
	<xsl:param name="pie_label_font_weight"       select="$font_weight" />
	<xsl:param name="pie_label_font_style"        select="$font_style" />
	<xsl:param name="pie_label_font_decoration"   select="$font_decoration" />
	<xsl:param name="pie_label_font_filter"       select="$font_filter" />
	<xsl:param name="pie_label_format"            select="'##0.00 %'" />

	<xsl:param name="pie_label_border_visible"      select="1" />
	<xsl:param name="pie_label_border_margin"       select="1" />
	<xsl:param name="pie_label_border_fill_color"   select="'none'" />
	<xsl:param name="pie_label_border_fill_opacity" select="0.8" />
	<xsl:param name="pie_label_border_stroke_color" select="'black'" />
	<xsl:param name="pie_label_border_stroke_width" select="0" />


	<!-- axis properties -->
	<xsl:param name="axis_color" select="'black'" />
	<xsl:param name="axis_width" select="1" />

  <!-- grid properties -->
  <xsl:param name="x_grid_color" select="'#ffffff'" />
  <xsl:param name="x_grid_color_shadow" select="'#a8a8a8'" />
  <xsl:param name="x_grid_width" select="1" />

  <xsl:param name="y_grid_color" select="'#ffffff'" />
  <xsl:param name="y_grid_color_shadow" select="'#a8a8a8'" />
  <xsl:param name="y_grid_width" select="1" />

	<!-- pie properties -->
	<xsl:param name="pie_size_min" select="10"/>
	<xsl:param name="pie_filter"  select="'none'"/>
	<xsl:param name="pie_ellipse"  select="0"/>
	<xsl:param name="pie_label_filter"  select="'drop_shadow'"/>
	
	<xsl:param name="pie_offset1" select="1"/>
	<xsl:param name="pie_offset2" select="1"/>

	<xsl:param name="pie_focal_x" select="0"/>
	<xsl:param name="pie_focal_y" select="0"/>
	<xsl:param name="pie_shift" select="1.2" />	<!--  3 ************   -->
	
	<xsl:param name="pie_fill"            select="'white'"/>
	<xsl:param name="pie_fill_opacity"    select="1"/>
	<xsl:param name="pie_stroke"          select="'black'"/>
	<xsl:param name="pie_stroke_opacity"  select="0"/>
	<xsl:param name="pie_stroke_width"    select="0"/>
	<xsl:param name="pie_shadow_color"   select="'black'"/>
	<xsl:param name="pie_shadow_opacity"  select="0.2"/>
	<xsl:param name="pie_shadow_shift_x" select="3"/>
    <xsl:param name="pie_shadow_shift_y" select="3"/>

	
 <!-- background properties (CUBE DESIGNER)-->
  <xsl:param name="background_visible" select="1"/>
  <xsl:param name="background_color1" select="'rgb(229,229,229)'"/>
  <xsl:param name="background_margin" select="10"/>
  
	<!-- filter properties -->
	<xsl:param name="filter_shadow_deviation" select="1"/>

	<!-- constants -->
	<xsl:variable name="pi" select="math:constant('PI',6)"/>
	<xsl:variable name="pi2" select="$pi * 2"/>
	<xsl:variable name="offset_angle" select="- $pi div 2"/>

	<!-- match root element -->
	<xsl:template match="graph">

	<!-- global constants-->

	<!-- legend properties -->
	<xsl:variable name="legend_max_car" select="exsl4D:max-value-length(x_values/v,$x_label_format_number,$x_label_format_date,$x_label_format_time)+2"/>
	<!--<xsl:variable name="legend_max_car" select="10+2"/>-->
	<xsl:variable name="legend_label_width" select="$legend_max_car*$legend_font_width"/>
	<xsl:variable name="legend_box_width" select="number(boolean(x_values/v[1]))*($base_margin+$legend_bullet_size+$base_margin+$legend_label_width+$base_margin)"/>
	<xsl:variable name="legend_box_height" select="$base_margin+(($legend_bullet_size+$base_margin)*count(x_values/v))"/>

	<xsl:variable name="y_values_count" select="count(y_values)" />

	<!-- graph margins -->
	<xsl:variable name="graph_left_margin" select="$base_margin" />
	<xsl:variable name="graph_right_margin" select="$legend_box_width+(2*$base_margin)" />
	<!--
	<xsl:variable name="graph_right_margin" select="(($legend_box_width+$base_margin)*number(boolean(x_values/v)))+$base_margin"/>
	<xsl:variable name="graph_top_margin" select="(number(boolean($title))*($title_font_size+$title_margin))+$base_margin" />
	-->
	<xsl:variable name="graph_top_margin" select="$base_margin*1" />
	<xsl:variable name="graph_bottom_margin" select="$base_margin*1" />

	<!-- viewbox properties -->

	<xsl:variable name="temp_viewbox_width" select="exsl4D:max($viewport_width,($pie_size_min + ($graph_right_margin - $graph_left_margin) ))" />
	<xsl:variable name="viewbox_height" select="exsl4D:max($viewport_height,(exsl4D:max($pie_size_min,$legend_box_height)+$graph_top_margin+$graph_bottom_margin))" />
	<xsl:variable name="viewbox_width" select="exsl4D:max($viewbox_height,$temp_viewbox_width)" />

	<!--
    <xsl:variable name="viewbox_width" select="$viewport_width" />
    <xsl:variable name="viewbox_height" select="$viewport_height" />
    -->

	<!-- pie properties -->
	<xsl:variable name="pie_x" select="$graph_left_margin" />   <!-- sans tenir compte de l'éclatement -->
	<xsl:variable name="pie_y" select="$graph_top_margin" />   <!-- sans tenir compte de l'éclatement -->

	<xsl:variable name="pie_tempwidth" select="$viewbox_width - 1*($graph_left_margin + $graph_right_margin)" />
	<xsl:variable name="pie_tempheight" select="$viewbox_height - 1*($graph_top_margin + $graph_bottom_margin)" />

	<xsl:variable name="pie_width" select="exsl4D:min($pie_tempwidth,$pie_tempheight)" />
	<xsl:variable name="pie_height" select="$pie_width" />

	<!-- center x and y for pies -->
	<xsl:variable name="pie_cx" select="$graph_left_margin + (($viewbox_width - $graph_right_margin - $graph_left_margin) div 2)" />		
	<xsl:variable name="pie_cy" select="$graph_top_margin + (($viewbox_height - $graph_top_margin - $graph_bottom_margin) div 2)" />		
	
	<xsl:variable name="pie_r"  select="(($pie_height - $pie_shift) div 2)  - $background_margin" />
	

	
<!--
	<xsl:variable name="pie_fx" select="$pie_cx+($pie_focal_x*$pie_r)" />
	<xsl:variable name="pie_fy" select="$pie_cy+($pie_focal_y*$pie_r)" />
-->
	<!--<xsl:variable name="pie_r"  select="$pie_height" />-->

	<!-- legend properties -->
	<xsl:variable name="legend_box_x" select="$viewbox_width - $graph_right_margin + $base_margin"/>
	<xsl:variable name="legend_box_y" select="$graph_top_margin"/>
	<xsl:variable name="legend_bullet_x" select="$legend_box_x + $base_margin"/>
	<xsl:variable name="legend_bullet_y" select="$legend_box_y + $base_margin"/>
	<xsl:variable name="legend_label_x" select="$legend_bullet_x + $legend_bullet_size + $base_margin"/>
	<xsl:variable name="legend_label_y" select="$legend_bullet_y + $legend_bullet_size - (($legend_bullet_size - $legend_font_size) div 2) - $legend_font_descent"/>
	<xsl:variable name="legend_step_y" select="$legend_bullet_size+$base_margin"/>

	<!-- title properties -->
	<xsl:variable name="title_max_car" select="string-length($title)"/>
	<xsl:variable name="title_label_width" select="$title_max_car*$title_font_width"/>
	<xsl:variable name="title_pos_y" select="$base_margin+$title_font_size" />
	<xsl:variable name="title_pos_x" select="$graph_left_margin + (($viewbox_width - $graph_left_margin - $graph_right_margin) div 2)"/>


		<!-- create svg root element-->
		<svg id="ID_svg" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 {$viewbox_width} {$viewbox_height}" viewport-fill="{$viewport_color}" viewport-fill-opacity="{$viewport_opacity}">
			<xsl:comment>gradient styles</xsl:comment>
			<defs >

				<xsl:call-template name="filter_defs">
					<xsl:with-param name="shadow_deviation" select="$filter_shadow_deviation"/>
				</xsl:call-template>
			</defs>
			
			<!-- debug rect
			<rect x="1" y="1" width="{$viewport_width}" height="{$viewport_height}"  rx="10" fill = "lightblue"/>
			-->
			
			<xsl:comment>global stroke and font styles</xsl:comment>
			<g id="ID_globals" style="fill:{$font_color};stroke:none;font-family:{$font_family};font-size:{$font_size}px;font-weight:{$font_weight};font-style:{$font_style};text-decoration:{$font_decoration};shape-rendering:{$shape_rendering}">
				<xsl:comment>draw title</xsl:comment>
				<xsl:if test="$title_max_car &gt; 0">
					<g id="ID_title" style="fill:{$title_color};stroke:none;font-family:{$title_font_family};font-size:{$title_font_size}px;font-weight:{$title_font_weight};font-style:{$title_font_style};text-decoration:{$title_font_decoration};filter:{$title_font_filter}" >
						<xsl:call-template name="label_align_middle">
							<xsl:with-param name="x"                      select="$title_pos_x" />
							<xsl:with-param name="y"                      select="$title_pos_y" />
							<xsl:with-param name="text"                   select="$title"/>

							<xsl:with-param name="font_size"              select="$title_font_size"/>
							<xsl:with-param name="font_descent"           select="$title_font_descent"/>

							<xsl:with-param name="border_visible"         select="$title_border_visible" />
							<xsl:with-param name="border_margin"          select="$title_border_margin" />
							<xsl:with-param name="border_fill_color"      select="$title_border_fill_color" />
							<xsl:with-param name="border_fill_opacity"    select="$title_border_fill_opacity" />
							<xsl:with-param name="border_stroke_color"    select="$title_border_stroke_color" />
							<xsl:with-param name="border_stroke_width"    select="$title_border_stroke_width" />
						</xsl:call-template>
					</g>
				</xsl:if>



				<xsl:comment>draw legend</xsl:comment>    
				<xsl:if test="x_values/v" >
					<g id="ID_legend" visibility="{$legend_visibility}">
						<xsl:comment>draw legend border</xsl:comment>
						<xsl:call-template name="legend_border">
							<xsl:with-param name="x" select="$legend_box_x" />
							<xsl:with-param name="y" select="$legend_box_y" />
							<xsl:with-param name="rx" select="$legend_rx" />
							<xsl:with-param name="ry" select="$legend_ry" />
							<xsl:with-param name="width" select="$legend_box_width" />
							<xsl:with-param name="height" select="$legend_box_height" />
							<xsl:with-param name="fill-color" select="$legend_rect_fill_color" />
							<xsl:with-param name="fill-opacity" select="$legend_rect_fill_opacity" />
							<xsl:with-param name="stroke-color" select="$legend_rect_stroke_color" />
							<xsl:with-param name="stroke-width" select="$legend_rect_stroke_width" />
						</xsl:call-template>
						<xsl:comment>draw legend bullets</xsl:comment>
						<g id="ID_legend_bullets" stroke="{$legend_bullet_stroke_color}">
							<xsl:for-each select="x_values/v">
                <xsl:variable name="index" select="position()"/>


                <!-- get data type color -->
                <xsl:variable name="fill_color">
                  <xsl:choose>
                    <xsl:when test="$index = 1">
                      <xsl:value-of select="$default_color1"/>
                    </xsl:when>
                    <xsl:when test="$index = 2">
                      <xsl:value-of select="$default_color2"/>
                    </xsl:when>
                    <xsl:when test="$index = 3">
                      <xsl:value-of select="$default_color3"/>
                    </xsl:when>
                    <xsl:when test="$index = 4">
                      <xsl:value-of select="$default_color4"/>
                    </xsl:when>
                    <xsl:when test="$index = 5">
                      <xsl:value-of select="$default_color5"/>
                    </xsl:when>
                    <xsl:when test="$index = 6">
                      <xsl:value-of select="$default_color6"/>
                    </xsl:when>
                    <xsl:when test="$index = 7">
                      <xsl:value-of select="$default_color7"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="$default_color8"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:variable>

                <xsl:call-template name="legend_bullet">
                  <xsl:with-param name="x" select="$legend_bullet_x" />
                  <xsl:with-param name="y" select="$legend_bullet_y+$legend_step_y*(position()-1)" />
                  <xsl:with-param name="width" select="$legend_bullet_size" />
                  <xsl:with-param name="height" select="$legend_bullet_size" />
                  <xsl:with-param name="fill" select="$fill_color" />
                  <xsl:with-param name="filter" select="$legend_bullet_filter" />
                  <xsl:with-param name="id" select="concat($legend_bullet_name,string(position()))" />
                  <xsl:with-param name="stroke" select="'black'" />
                  <xsl:with-param name="stroke-width" select="$legend_rect_stroke_width" />
				</xsl:call-template>
				</xsl:for-each>
				
				</g>
					<xsl:comment>draw legend labels</xsl:comment>
					<g id="ID_legend_labels" style="fill:{$legend_color};stroke:none;font-family:{$legend_font_family};font-size:{$legend_font_size}px;font-weight:{$legend_font_weight};font-style:{$legend_font_style};text-decoration:{$legend_font_decoration};filter:{$legend_font_filter};text-anchor:start">
						<xsl:for-each select="x_values/v">
							<text x="{$legend_label_x}" y="{$legend_label_y+$legend_step_y*(position()-1)}" >
								<xsl:value-of select="exsl4D:format-value(text(),$x_label_format_number,$x_label_format_date,$x_label_format_time)"/>
							</text>
						</xsl:for-each>
					</g>
				</g>
				
				</xsl:if>

				<!--
				<rect x="{$pie_x}" y="{$pie_y}" width="{$pie_width}" height="{$pie_height}" fill = "grey"/>  
				-->
				
				<xsl:comment>draw graph background</xsl:comment>
		        <xsl:if test="$background_visible">
		          <xsl:call-template name="graph_background">
		            <xsl:with-param name="x" select="$graph_left_margin" />
		            <xsl:with-param name="y" select="$graph_top_margin" />
		            <xsl:with-param name="width" select="$viewbox_width - $graph_right_margin - $graph_left_margin" />
		            <xsl:with-param name="height" select="$viewbox_height - $graph_bottom_margin - $graph_top_margin"/>
		            <xsl:with-param name="y0" select="$y0"/>
		            <xsl:with-param name="top_fill" select="$background_color1"/>
		            <xsl:with-param name="bottom_fill" select="$background_color1"/>
		          </xsl:call-template>
		        </xsl:if>
		        
				<xsl:variable name="y_values_tot"  select="sum(y_values/v)" />
				<xsl:comment>set pie global transform</xsl:comment>
				

				<xsl:comment>draw pie SLICES SHADOWS </xsl:comment>
					<g id="ID_pie" filter="{$pie_filter}">
						<!-- iterate on all data types -->
						<xsl:for-each select="x_values/v">
							<xsl:comment>
								draw pie piece <xsl:value-of select="string(position())"></xsl:value-of>
							</xsl:comment>
							
							<!-- local variables--> 
					        <xsl:variable name="y_values_index" select="position()"/>
				
							<xsl:choose>
														
								<xsl:when test="position() = 1">
									<g id="ID_graph_shadow_1" fill = "{$pie_shadow_color}" fill-opacity="{$pie_shadow_opacity}" stroke="{$pie_stroke}" stroke-opacity="{$pie_stroke_opacity}" stroke-width="{$pie_stroke_width}">
										<xsl:variable name="pos" select="position()"/>
										<xsl:variable name="y_values_sum"  select="sum(../../y_values/v[$pos])" />
										<xsl:choose>
											
											<xsl:when test="$y_values_tot" >
												<xsl:variable name="end_angle" select="($y_values_sum * $pi2) div $y_values_tot" />
												<xsl:call-template name="pie_shadow">
													<xsl:with-param name="cx" select="$pie_cx + $pie_shadow_shift_x" />
													<xsl:with-param name="cy" select="$pie_cy + $pie_shadow_shift_y" />
													<xsl:with-param name="ray" select="$pie_r" />
													<xsl:with-param name="start" select="$offset_angle" />
													<xsl:with-param name="end" select="$offset_angle + $end_angle" />
													<xsl:with-param name="large_arc" select="number(($end_angle) &gt; $pi)" />
													<xsl:with-param name="shift" select="$pie_shift" />
												</xsl:call-template>
											</xsl:when>
											
											<xsl:otherwise>
												<xsl:variable name="end_angle" select="$pi2" />
												<xsl:call-template name="pie_shadow">
													<xsl:with-param name="cx" select="$pie_cx + $pie_shadow_shift_x" />
													<xsl:with-param name="cy" select="$pie_cy + $pie_shadow_shift_y" />
													<xsl:with-param name="ray" select="$pie_r" />
													<xsl:with-param name="start" select="$offset_angle" />
													<xsl:with-param name="end" select="$offset_angle + $end_angle" />
													<xsl:with-param name="large_arc" select="number(($end_angle) &gt; $pi)" />
													<xsl:with-param name="shift" select="$pie_shift" />
												</xsl:call-template>
											</xsl:otherwise>
											
										</xsl:choose>
									</g>
								</xsl:when>
								
								<xsl:otherwise>
									<g id="ID_graph_shadow_{position()}" fill = "{$pie_shadow_color}" fill-opacity="{$pie_shadow_opacity}" stroke="{$pie_stroke}" stroke-opacity="{$pie_stroke_opacity}" stroke-width="{$pie_stroke_width}">
										<xsl:variable name="pos" select="position()"/>
										<xsl:variable name="y_values_prev_sum"  select="sum(../../y_values/v[position() &lt; $pos])" />
										<xsl:variable name="y_values_sum"  select="sum(../../y_values/v[position() &lt; ($pos + 1)])" />
										<xsl:if test="$y_values_tot">
											<xsl:variable name="start_angle" select="($y_values_prev_sum * $pi2) div $y_values_tot"/>
											<xsl:variable name="end_angle" select="($y_values_sum * $pi2) div $y_values_tot" />
											<xsl:call-template name="pie_shadow">
												<xsl:with-param name="cx" select="$pie_cx + $pie_shadow_shift_x" />
												<xsl:with-param name="cy" select="$pie_cy + $pie_shadow_shift_y" />
												<xsl:with-param name="ray" select="$pie_r" />
												<xsl:with-param name="start" select="$offset_angle + $start_angle" />
												<xsl:with-param name="end" select="$offset_angle + $end_angle" />
												<xsl:with-param name="large_arc" select="number(($end_angle - $start_angle) &gt; $pi)" />
												<xsl:with-param name="shift" select="$pie_shift" />
											</xsl:call-template>
										</xsl:if>
									</g>
								</xsl:otherwise>
								
							</xsl:choose>
						</xsl:for-each>
					</g>





					<xsl:comment>draw pie SLICES </xsl:comment>
					<g id="ID_pie" filter="{$pie_filter}">
						<!-- iterate on all data types -->
						<xsl:for-each select="x_values/v">
							<xsl:comment>
								draw pie piece <xsl:value-of select="string(position())"></xsl:value-of>
							</xsl:comment>
							
							<!-- local variables--> 
					          <xsl:variable name="y_values_index" select="position()"/>

					          <!-- get data type color -->
					          <xsl:variable name="fill_color">
					            <xsl:choose>
					              <xsl:when test="$y_values_index = 1">
					                <xsl:value-of select="$default_color1"/>
					              </xsl:when>
					              <xsl:when test="$y_values_index = 2">
					                <xsl:value-of select="$default_color2"/>
					              </xsl:when>
					              <xsl:when test="$y_values_index = 3">
					                <xsl:value-of select="$default_color3"/>
					              </xsl:when>
					              <xsl:when test="$y_values_index = 4">
					                <xsl:value-of select="$default_color4"/>
					              </xsl:when>
					              <xsl:when test="$y_values_index = 5">
					                <xsl:value-of select="$default_color5"/>
					              </xsl:when>
					              <xsl:when test="$y_values_index = 6">
					                <xsl:value-of select="$default_color6"/>
					              </xsl:when>
					              <xsl:when test="$y_values_index = 7">
					                <xsl:value-of select="$default_color7"/>
					              </xsl:when>
					              <xsl:otherwise>
					                <xsl:value-of select="$default_color8"/>
					              </xsl:otherwise>
					            </xsl:choose>  
					          </xsl:variable>
							
							<xsl:choose>
								
								<xsl:when test="position() = 1">
									<g id="ID_graph_1" fill = "{$fill_color}" fill-opacity="{$pie_fill_opacity}" stroke="{$pie_stroke}" stroke-opacity="{$pie_stroke_opacity}" stroke-width="{$pie_stroke_width}">
										<xsl:variable name="pos" select="position()"/>
										<xsl:variable name="y_values_sum"  select="sum(../../y_values/v[$pos])" />
										<xsl:choose>
											
											<xsl:when test="$y_values_tot" >
												<xsl:variable name="end_angle" select="($y_values_sum * $pi2) div $y_values_tot" />
												<xsl:call-template name="pie">
													<xsl:with-param name="cx" select="$pie_cx" />
													<xsl:with-param name="cy" select="$pie_cy" />
													<xsl:with-param name="ray" select="$pie_r" />
													<xsl:with-param name="start" select="$offset_angle" />
													<xsl:with-param name="end" select="$offset_angle + $end_angle" />
													<xsl:with-param name="large_arc" select="number(($end_angle) &gt; $pi)" />
													<xsl:with-param name="shift" select="$pie_shift" />
												</xsl:call-template>
											</xsl:when>
											
											<xsl:otherwise>
												<xsl:variable name="end_angle" select="$pi2" />
												<xsl:call-template name="pie">
													<xsl:with-param name="cx" select="$pie_cx" />
													<xsl:with-param name="cy" select="$pie_cy" />
													<xsl:with-param name="ray" select="$pie_r" />
													<xsl:with-param name="start" select="$offset_angle" />
													<xsl:with-param name="end" select="$offset_angle + $end_angle" />
													<xsl:with-param name="large_arc" select="number(($end_angle) &gt; $pi)" />
													<xsl:with-param name="shift" select="$pie_shift" />
												</xsl:call-template>
											</xsl:otherwise>
											
										</xsl:choose>
									</g>
								</xsl:when>
								
								<xsl:otherwise>
									<g id="ID_graph_{position()}" fill = "{$fill_color}" fill-opacity="{$pie_fill_opacity}" stroke="{$pie_stroke}" stroke-opacity="{$pie_stroke_opacity}" stroke-width="{$pie_stroke_width}">
										<xsl:variable name="pos" select="position()"/>
										<xsl:variable name="y_values_prev_sum"  select="sum(../../y_values/v[position() &lt; $pos])" />
										<xsl:variable name="y_values_sum"  select="sum(../../y_values/v[position() &lt; ($pos + 1)])" />
										<xsl:if test="$y_values_tot">
											<xsl:variable name="start_angle" select="($y_values_prev_sum * $pi2) div $y_values_tot"/>
											<xsl:variable name="end_angle" select="($y_values_sum * $pi2) div $y_values_tot" />
											<xsl:call-template name="pie">
												<xsl:with-param name="cx" select="$pie_cx" />
												<xsl:with-param name="cy" select="$pie_cy" />
												<xsl:with-param name="ray" select="$pie_r" />
												<xsl:with-param name="start" select="$offset_angle + $start_angle" />
												<xsl:with-param name="end" select="$offset_angle + $end_angle" />
												<xsl:with-param name="large_arc" select="number(($end_angle - $start_angle) &gt; $pi)" />
												<xsl:with-param name="shift" select="$pie_shift" />
											</xsl:call-template>
										</xsl:if>
									</g>
								</xsl:otherwise>
								
							</xsl:choose>
						</xsl:for-each>
					</g>

			

				<xsl:comment>draw pie LABELS</xsl:comment>
				
				<!-- iterate on all data types -->
				<xsl:if test="boolean($pie_label_visible)">
					
					<g id="ID_pie_labels" style="fill:{$pie_label_color};stroke:none;font-family:{$pie_label_font_family};font-size:{$pie_label_font_size}px;font-weight:{$pie_label_font_weight};font-style:{$pie_label_font_style};text-decoration:{$pie_label_font_decoration};filter:{$pie_label_font_filter};text-anchor:middle">
						<xsl:for-each select="x_values/v">
							<xsl:comment>
								draw pie piece label <xsl:value-of select="string(position())"></xsl:value-of>
							</xsl:comment>
							
							<!-- local variables--> 
					          <xsl:variable name="y_values_index" select="position()"/>
							  <xsl:variable name="fill_color" select="'white'"/>
							
							  <!-- get data type color -->
								<!--        
								  <xsl:variable name="fill_color">
								            <xsl:choose>
								              <xsl:when test="$y_values_index = 1">
								                <xsl:value-of select="$default_color1"/>
								              </xsl:when>
								              <xsl:when test="$y_values_index = 2">
								                <xsl:value-of select="$default_color2"/>
								              </xsl:when>
								              <xsl:when test="$y_values_index = 3">
								                <xsl:value-of select="$default_color3"/>
								              </xsl:when>
								              <xsl:when test="$y_values_index = 4">
								                <xsl:value-of select="$default_color4"/>
								              </xsl:when>
								              <xsl:when test="$y_values_index = 5">
								                <xsl:value-of select="$default_color5"/>
								              </xsl:when>
								              <xsl:when test="$y_values_index = 6">
								                <xsl:value-of select="$default_color6"/>
								              </xsl:when>
								              <xsl:when test="$y_values_index = 7">
								                <xsl:value-of select="$default_color7"/>
								              </xsl:when>
								              <xsl:otherwise>
								                <xsl:value-of select="$default_color8"/>
								              </xsl:otherwise>
								            </xsl:choose>  
								          </xsl:variable>
								    -->
					    
							<xsl:choose>
								<xsl:when test="position() = 1">
									<g id="ID_pie_label_1">
										<xsl:variable name="pos" select="position()"/>
										<xsl:variable name="y_values_sum"  select="sum(../../y_values/v[$pos])" />
										<xsl:choose>
											<xsl:when test="$y_values_tot">
												<xsl:variable name="end_angle" select="($y_values_sum * $pi2) div $y_values_tot" />
												<xsl:call-template name="pie_label_percent">
													<xsl:with-param name="cx"                   select="$pie_cx" />
													<xsl:with-param name="cy"                   select="$pie_cy" />
													<xsl:with-param name="r"                    select="$pie_r" />
													<xsl:with-param name="sx"                   select="$pie_scalex" />
													<xsl:with-param name="sy"                   select="$pie_scaley" />
													<xsl:with-param name="start"                select="$offset_angle" />
													<xsl:with-param name="end"                  select="$offset_angle + $end_angle" />
													<xsl:with-param name="pi2"                  select="$pi2" />
													<xsl:with-param name="format"               select="$pie_label_format" />
													
													<xsl:with-param name="font_size"            select="$pie_label_font_size"/>
													<xsl:with-param name="font_descent"         select="$pie_label_font_descent"/>
													<xsl:with-param name="font_color"           select="$fill_color"/>
													
													<xsl:with-param name="border_visible"       select="$pie_label_border_visible" />
													<xsl:with-param name="border_margin"        select="$pie_label_border_margin" />
												    <xsl:with-param name="border_fill_color"    select="$pie_label_border_fill_color" /> 
													<xsl:with-param name="border_fill_opacity"  select="$pie_label_border_fill_opacity" />
													<xsl:with-param name="border_stroke_color"  select="$pie_label_border_stroke_color" />
													<xsl:with-param name="border_stroke_width"  select="$pie_label_border_stroke_width" />
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:variable name="end_angle" select="$pi2" />
												<xsl:call-template name="pie_label_percent">
													<xsl:with-param name="cx"                   select="$pie_cx" />
													<xsl:with-param name="cy"                   select="$pie_cy" />
													<xsl:with-param name="r"                    select="0.0000000001" />
													<xsl:with-param name="sx"                   select="$pie_scalex" />
													<xsl:with-param name="sy"                   select="$pie_scaley" />
													<xsl:with-param name="start"                select="$offset_angle" />
													<xsl:with-param name="end"                  select="$offset_angle + $end_angle" />
													<xsl:with-param name="pi2"                  select="$pi2" />
													<xsl:with-param name="format"               select="$pie_label_format" />

													<xsl:with-param name="font_size"            select="$pie_label_font_size"/>
													<xsl:with-param name="font_descent"         select="$pie_label_font_descent"/>
													<xsl:with-param name="font_color"           select="$fill_color"/>
													
													<xsl:with-param name="border_visible"       select="$pie_label_border_visible" />
													<xsl:with-param name="border_margin"        select="$pie_label_border_margin" />
													<xsl:with-param name="border_fill_color"    select="$pie_label_border_fill_color" />
													<xsl:with-param name="border_fill_opacity"  select="$pie_label_border_fill_opacity" />
													<xsl:with-param name="border_stroke_color"  select="$pie_label_border_stroke_color" />
													<xsl:with-param name="border_stroke_width"  select="$pie_label_border_stroke_width" />
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</g>
									
									
								</xsl:when>
								<xsl:otherwise>
									<g id="ID_pie_label_{position()}">
										<xsl:variable name="pos" select="position()"/>
										<xsl:variable name="y_values_prev_sum"  select="sum(../../y_values/v[position() &lt; $pos])" />
										<xsl:variable name="y_values_sum"  select="sum(../../y_values/v[position() &lt; ($pos + 1)])" />
										<xsl:if test="$y_values_tot">
											<xsl:variable name="start_angle" select="($y_values_prev_sum * $pi2) div $y_values_tot"/>
											<xsl:variable name="end_angle" select="($y_values_sum * $pi2) div $y_values_tot" />
											<xsl:call-template name="pie_label_percent">
												<xsl:with-param name="cx"                   select="$pie_cx" />
												<xsl:with-param name="cy"                   select="$pie_cy" />
												<xsl:with-param name="r"                    select="$pie_r" />
												<xsl:with-param name="sx"                   select="$pie_scalex" />
												<xsl:with-param name="sy"                   select="$pie_scaley" />
												<xsl:with-param name="start"                select="$offset_angle + $start_angle" />
												<xsl:with-param name="end"                  select="$offset_angle + $end_angle" />
												<xsl:with-param name="pi2"                  select="$pi2" />
												<xsl:with-param name="format"               select="$pie_label_format" />

												<xsl:with-param name="font_size"            select="$pie_label_font_size"/>
												<xsl:with-param name="font_descent"         select="$pie_label_font_descent"/>
												<xsl:with-param name="font_color"           select="$fill_color"/>
													
												<xsl:with-param name="border_visible"       select="$pie_label_border_visible" />
												<xsl:with-param name="border_margin"        select="$pie_label_border_margin" />
												<xsl:with-param name="border_fill_color"    select="$pie_label_border_fill_color" />
												<xsl:with-param name="border_fill_opacity"  select="$pie_label_border_fill_opacity" />
												<xsl:with-param name="border_stroke_color"  select="$pie_label_border_stroke_color" />
												<xsl:with-param name="border_stroke_width"  select="$pie_label_border_stroke_width" />
											</xsl:call-template>
										</xsl:if>
									</g>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</g>
				</xsl:if>
			</g>
			
		</svg>
	</xsl:template>
</xsl:stylesheet>
