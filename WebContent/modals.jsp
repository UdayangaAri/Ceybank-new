<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">

		<div class="modal-dialog modal-lg">

			<div class="modal-content">

				<form action="Guest_saveServlet" method="post">

					<div class="modal-header" style="text-align: center;">
						<h3 class="modal-title" id="exampleModalLabel">Add New Guest</h3>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body" style="text-align: center;">


						<div class="row">

							<div class="col-25">Name</div>
							<div class="col-65">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<select class="custom-select" id="position" name="position">

											<option value="Mr">Mr</option>
											<option value="Mrs">Mrs</option>
											<option value="Ms">Ms</option>
											<option value="Dr">Dr</option>
										</select>
									</div>
									<input type="text" name="name" required class="form-control"
										aria-label="Text input with dropdown button">
								</div>
							</div>
						</div>

						<div class="row">


							<div class="col-25">Address</div>

							<div class="col-65">
								<input type="text" name="address" value="" required
									placeholder="Address">
							</div>
						</div>


						<div class="row">


							<div class="col-25">City</div>

							<div class="col-65">
								<input type="text" name="city" value="" required
									placeholder="City">
							</div>

						</div>

						<div class="row">


							<div class="col-25">Residence Country</div>

							<div class="col-65">
								<input type="text" name="r_country" required value=""
									placeholder="Residence Country">
							</div>

						</div>

						<div class="row">


							<div class="col-25">Citizenship</div>

							<div class="col-65">
								<input type="text" name="citizenship" required value=""
									placeholder="Citizenship">
							</div>

						</div>

						<div class="row">


							<div class="col-25">NIC Number</div>

							<div class="col-65">
								<input type="text" name="nic" value="" required
									placeholder="NIC Number">
							</div>

						</div>

						<div class="row">


							<div class="col-25">Mobile</div>

							<div class="col-65">
								<input type="text" name="mobile" value="" required
									placeholder="Mobile">
							</div>

						</div>

						<div class="row">


							<div class="col-25">Date of Birth</div>

							<div class="col-65">
								<input type="date" name="dob" value="" required
									placeholder="Date of Birth">
							</div>

						</div>

						<div class="row">


							<div class="col-25">Email</div>

							<div class="col-65">
								<input type="email" name="email" value="" required
									placeholder="Email">
							</div>
						</div>

						<div class="row">


							<div class="col-25">Profession</div>

							<div class="col-65">
								<input type="text" name="profession" required value=""
									placeholder="Profession">
							</div>

						</div>


						<br>


						<div class="row">


							<div class="col-25">Guest Type</div>

							<div class="col-65">
								<div style="float: left;" >

									<label onclick="javascript:yesnoCheck();"> <input
										type="radio" name="options" id="noCheck" value="Public">Public
									</label>
									<label onclick="javascript:yesnoCheck();"> <input
										type="radio" name="options" id="yesCheck" value="">BOC Staff
									</label>  <br>
								</div>

								<div class="col-40" style="float: right;" id="ifYes"
									style="visibility: hidden">
									<input type="text" id="yes" name="pfnovalue" value=""
										placeholder="PF Number" >
								</div>
							</div>
						</div>


					</div>

					<div class="modal-footer">

						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>

						<button type="submit" class="btn btn-primary">Add Guest</button>
					</div>

				</form>

			</div>


		</div>




	</div>
	
	
	
	
	
	
	
	
	
	<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" id="UpdateUser" aria-hidden="true">

		<div class="modal-dialog modal-lg">

			<div class="modal-content">

				<form action="Guest_saveServlet" method="post">

					<div class="modal-header" style="text-align: center;">
						<h3 class="modal-title" id="exampleModalLabel">Add New Guest</h3>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body" style="text-align: center;">


						<div class="row">

							<div class="col-25">Name</div>
							<div class="col-65">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<select class="custom-select" id="position" name="position">

											<option value="Mr">Mr</option>
											<option value="Mrs">Mrs</option>
											<option value="Ms">Ms</option>
											<option value="Dr">Dr</option>
										</select>
									</div>
									<input type="text" name="name" required class="form-control"
										aria-label="Text input with dropdown button">
								</div>
							</div>
						</div>

						
					</div>

					<div class="modal-footer">

						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>

						<button type="submit" class="btn btn-primary">Add Guest</button>
					</div>

				</form>

			</div>


		</div>




	</div>




	